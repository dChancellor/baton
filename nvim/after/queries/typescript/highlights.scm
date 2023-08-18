; extends
(["let" "const"]) @DCHVarDeclarations

; typeof SvelteComponent <-- tagets SvelteComponent
(type_query
	(identifier) @DCHTypeQueryID
	(#set! "priority" 1100)
  )
; const test: undefined <--- targets undefined
(literal_type
  [
  	(undefined) @DCHLiteralType
  	(null) @DCHLiteralType
  	(string) @DCHTypeQueryID
	(#set! "priority" 1100)
  ]
) 
; type Test = {} <--- targets "type"
(type_alias_declaration
("type") @DCHWordType
  )

; $: myvariable <-- targets both $ and : separatly
(labeled_statement
  label: (statement_identifier) @DCHSvelteReactive (#eq? @DCHSvelteReactive "$")
  (":") @DCHOperator
)
