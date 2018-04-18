line(
    choice('=>', None),
    line(choice(None,loop(
        choice('/id',
        line('#','/id'), 'all'),
        '& or |'
    )),
    choice(None, line('~', '/id')),
    choice("=>",None)
))
