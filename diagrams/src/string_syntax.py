line(
    '"',
    loop(
        choice(
            line('^','/id', ' '),
            line('^(','/value',')'),
            '[^"]',
            line('\\', '[.]')
        )
    ),
    '"'
)
