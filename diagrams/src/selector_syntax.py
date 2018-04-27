
choice(
    line('{', '/selector', '}'),
    line('/selector', '&', '/selector'),
    line('/selector', '|', '/selector'),
    line('-', '/selector'),
    '/id',
    line('#','/id'),
    '*'
)
