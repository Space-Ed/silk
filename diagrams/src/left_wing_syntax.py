line(
    loop(
        line(
            choice(
                line(choice(line('(', '#value', ')'), '@'), choice('/id', '$')),
                choice('/id', '$'),
                line(choice('/id', '$'), choice(line('(', '#value', ')'), '@'))
            ),
            choice('=','<=','=>','<>', '><'),
            choice(None, '/id', '$')
        ),
        ','
    ),
    '|'
)
