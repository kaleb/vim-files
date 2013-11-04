" syntastic html tidy configuration: -----------------------------------------
" see: http://tidy.sourceforge.net/docs/quickref.html

" list of errors to ignore
let g:syntastic_html_tidy_ignore_errors = [
	\"trimming empty <i>",
	\"trimming empty <span>",
	\"<input> proprietary attribute \"autocomplete\"",
	\"proprietary attribute \"role\"",
	\"proprietary attribute \"hidden\"",
\]

" list of additional blocklevel tags, to be added to "--new-blocklevel-tags"
let g:syntastic_html_tidy_blocklevel_tags = [
\]

" list of additional inline tags, to be added to "--new-inline-tags"
let g:syntastic_html_tidy_inline_tags = [
\]

" list of additional empty tags, to be added to "--new-empty-tags"
let g:syntastic_html_tidy_empty_tags = [
\]
