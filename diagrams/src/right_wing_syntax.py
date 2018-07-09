line(
    '|',
    loop(
        line(
            opt(choice(None, '/id'), '='),
            choice(None, '/id'),
            choice(None,'+','-')
        ),
        ' '
    )
)
