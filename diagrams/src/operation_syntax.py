line(
    '(',
    choice(
        '+value',
        line(
            '+value',
            toploop(
                line(
                    choice('<=' , '<' , '>' , '>=' , '=' , '&' , '|' , '%' , '**' , '*' , '+' , '-', '<<', '>>', '*>', '<*'),
                    '+value'
                ),
                None
            ),
        )
    ),
    ')'
)
