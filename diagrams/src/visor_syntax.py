line(
    '(',
    loop(
        line(
            choice(None, line('/id','=')),
            '/selector',
            ':',
            '/value',opt('?')
        ),
        ';'
    ),
    ')'
)
