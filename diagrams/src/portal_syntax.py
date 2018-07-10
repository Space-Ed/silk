line(
    choice(
        '#value',
        '@'
    ),
    '~',
    choice(None, '/id'),
    choice(None, loop( line('.', '#value'), None ))
)
