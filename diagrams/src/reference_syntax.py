line(
    ' / ',
    loop(
        '/id',
        ' / '
    ),
    choice(
        None,
        line(
            '(',
            opt('/left_wing'),
            loop('/value',None),
            opt('/right_wing'),
            ')'
        )
    )
)
