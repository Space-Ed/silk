choice (
    loop(choice('digit')),
    line('{',
        choice(
            line(opt('-'), '/numeric'),
            '/portal',
            line('/numeric',
                choice(
                    '-', '+', '*', '**', '%', ' / ', ' // '
                ),
                '/numeric'
            )
        ),
        '}'
    )
)
