
line(
    '|',
    loop(
        line(
            choice(None, '/id', '$'),
            choice('=','<=','=>','<>', '><'),
            choice(
                line(
                    choice('/id', '$'),
                    choice(None,line('(', '#value', ')'), '@')),
                line(choice(line('(', '#value', ')'), '@'), choice('/id', '$')),
            )
        ),
        ','
    )
)
