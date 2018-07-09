line(
    loop(
        line(
            choice(None,'+','-'),
            choice(None, '/id'),
            opt('=', choice(None, '/id'))
        ),
        ' '
    ),
    '|'
)
