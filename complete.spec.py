
choice(
    line(
        opt('`'),
        choice(
            line('<',
                rightstack(
                    opt(opt('.'),loop('/id','.'), opt(' / ', opt('.'),loop('/id','.')), '~'),
                    loop(choice(
                        line(
                            choice('up', 'down'),opt('/id'),
                            loop(opt('#', '/id'), None),
                            ':',
                            choice('/value', line('draw', '/id'))
                        )
                    ), ',')
                ),'>'),
            line('(',
                choice(None, 'all', 'none', 'some', 'nall'),
                loop(# all terms
                    line( # single term
                        loop( #loop either & or |
                            choice('/id',line('#','/id'),'**','*'),
                            '& or |'
                        ),
                        ':',
                        line('/value',opt('?'), opt('let', choice(None, '/id')))
                    ), ','),
                ')'),
            line('{',
                loop(
                    choice(
                        '|',
                        '/value',
                        line('let','/id'),
                        line('draw', '/id'),
                        )
                    ,None),
                '}'),
            line('"', loop(choice('/char', line('^','/id','^')), None) ,'"')
            ),
        ),
    line('^', choice(
        line('let', '/id'),
        line('draw', '/id'),
        ), '^'),
    line(loop(None, '/digit'),'.', loop('/digit',None)),
    loop('/digit',None),
    line('in', choice(None, '/id', loop(
        choice('/id',line('#','/id'),'**','*'),
        '& or |'
    ))),
    line('out', choice(None,'/id',loop(
        choice('/id',line('#','/id'),'**','*'),
        '& or |'
    ))),
    'init',
    line(opt('[',
            loop(line(choice(None, '+','-','/id'), opt('=', choice(None, '/id'))),','),
        ),
        '/value',
        opt(loop(line(choice(None,'+','-', '/id'), opt('=', choice(None, '/id'))),','),
        ']')
    )
)
