line('<',
    line(
        choice(None, 'fuse', 'flush', 'base'),
        loop(choice(
            line(
                opt('/id'),
                loop(opt('#', '/id'), None),
                ':',
                '/value', opt('!')
                )
            ),
            ';'
        )
    )
,'>')
