line('<',
    loop(choice(
        line(
            opt('/id'),
            loop(opt('#', '/id'), None),
            ':',
            '/value',
            opt('!')
            )
        ),
        ','
    )
,'>')
