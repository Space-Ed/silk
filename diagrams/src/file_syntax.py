loop(
    line(
        opt('/id'),
        choice('<=', '|='),
        choice(
            line('/value'),
            line(
                choice(' / ', None),
                loop('/id', ' / '),
                choice(None, line(' / ', choice('*', '**')))
            )
        )
    ),
    '_'
)
