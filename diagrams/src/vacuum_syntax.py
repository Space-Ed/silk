line('(',
    choice(None, 'all', 'none', 'some', 'nall'),
    loop(
        line(
            loop(
                line(opt('-'),
                    choice('/id',line('#','/id'),'**','*'),
                ),
                '& or |'
            ),
            ':',
            '/value',opt('?')
        ), ';'),
    ')')
