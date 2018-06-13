line(
    choice(
        '/selector',
        '@'
    ),
    '~',
    choice(None, '/id'),
    choice(None, loop( line('.', '/id'), None ))
)
