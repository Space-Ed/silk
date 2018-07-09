line (
    opt('-'),
    loop('[0-9]', None),
    choice(
        None,
        line('.', loop('[0-9]', None))
    )
)
