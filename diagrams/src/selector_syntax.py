
choice(
    line('/', loop('/id', '/')),
    loop(
        line(
            opt('-'),
            choice(
                '/id',
                line('#','/id'),
                '**',
                '*'
            ),
        ),
        '/logical operator'
    )
)
