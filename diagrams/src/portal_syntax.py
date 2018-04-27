line(
    choice(
        loop(None, line(' / ', '/id')),
        '/selector',
        '@'
    ),
    '~',
    choice(None, '/id'),
    choice(None, loop( line('.', '/id'), None ))
)
