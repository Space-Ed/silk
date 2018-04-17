
choice(
    line(
        opt('`'),
        choice(
            line('<',
                line(
                    choice(None, 'merge', 'flush', 'base'),
                    loop(choice(
                        line(
                            opt('/id'),
                            loop(opt('#', '/id'), None),
                            ':',
                            '/value', opt('!')
                            )
                        ),
                        ','
                    )
                )
            ,'>'),
            line('(',
                choice(None, 'all', 'none', 'some', 'nall'),
                loop(# all terms
                    line(
                        loop( #loop either & or |
                            line(opt('-'),
                                choice('/id',line('#','/id'),'**','*'),
                            ),
                            '& or |'
                        ),
                        ':',
                        '/value',opt('?')
                    ), ','),
                ')'),
            line('{',
                line(
                    choice('fork', 'block'),
                    loop(
                        choice(
                            '|',
                            '/value',
                            line('let','/id'),
                            line('draw', '/id'),
                            )
                        ,None
                    )
                ),
                '}'),
            line('"', loop(choice('/char', line('^','/id','^')), None) ,'"')
            ),
        ),
    line('^', '/value', '^'),
    line(loop(None, '/digit'),'.', loop('/digit',None)),
    loop('/digit',None),

    line(choice('in', 'out', 'get'), line(choice(None,loop(
        choice('/id',
        line('#','/id'), 'all'),
        '& or |'
    )), choice(line('~', '/id'),'@')
    )),
    line(
        choice(None,'+','-'),
        opt('[',
            loop(line(choice(None, '+','-','/id'), opt('=', choice(None, '/id'))),' '),
        ),
        '/value',
        choice(
            None,
            line(loop(line(opt(choice(None, '/id'), '='),choice(None,'+','-', '/id')), ' '),
            ']')
        ),
        choice(None,'+','-')
    )
)
