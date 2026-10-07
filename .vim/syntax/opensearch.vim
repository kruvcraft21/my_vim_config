" OpenSearch Dev Tools syntax

if exists("b:current_syntax")
finish
endif

" Painless syntax based on Java
syntax include @Painless syntax/java.vim
unlet! b:current_syntax

" JSON syntax
runtime! syntax/json.vim
unlet! b:current_syntax

" Painless multiline code: """ ... """
syntax region opensearchPainless
      \ matchgroup=String
      \ start=/"""/
      \ end=/"""/
      \ keepend
      \ contains=@Painless,opensearchPainlessString

" Painless strings: 'text'
syntax match opensearchPainlessString
      \ /'[^']*'/
      \ contained
      \ containedin=opensearchPainless,@Painless

highlight default link opensearchPainlessString String

" OpenSearch request:
"
" GET /index/_search
" GET /*/_settings
" GET _ingest/pipeline/
" POST logs-*/_search
"
syntax match opensearchRequest
\ /^\s*\(GET\|POST\|PUT\|DELETE\|HEAD\|PATCH\)\s\+\S\+\s*$/
\ contains=opensearchMethod,opensearchSlash,opensearchQuerySep,opensearchQueryEq,opensearchQueryParam,opensearchQueryValue

" HTTP method
syntax match opensearchMethod
\ /\(GET\|POST\|PUT\|DELETE\|HEAD\|PATCH\)/
\ contained

" /
syntax match opensearchSlash
\ /\/\+/
\ contained

" ? и &
syntax match opensearchQuerySep
\ /[?&]/
\ contained

" =
syntax match opensearchQueryEq
\ /=/
\ contained

" Имя параметра
syntax match opensearchQueryParam
\ /[?&]\zs[^=& ]\+\ze=/
\ contained

" Значение параметра
syntax match opensearchQueryValue
\ /=\zs[^& ]\+/
\ contained

" Comments
syntax match opensearchComment /^\s*#.*$/
syntax match opensearchComment /^\s*\/\/.*$/

highlight default link opensearchRequest String
highlight default link opensearchMethod Keyword
highlight default link opensearchSlash Delimiter
highlight default link opensearchComment Comment
highlight default link opensearchQuerySep Delimiter
highlight default link opensearchQueryParam Identifier
highlight default link opensearchQueryValue Number

let b:current_syntax = "opensearch"
