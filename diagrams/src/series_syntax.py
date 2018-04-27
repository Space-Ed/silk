line(
    choice(None,'+','-'),
    '[',
    loop(
        line(
            choice(None, '+','-','/id'),
            opt('=', choice(None, '/id'))
        ),
        ' '
    ),
    loop('/value', choice('|', ' ')),
    loop(
        line(
            opt(choice(None, '/id'), '='),
            choice(None,'+','-', '/id')
        ),
        ' '
    ),
    ']',
    choice(None,'+','-')
)
