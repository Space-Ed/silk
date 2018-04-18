line(
    choice(None,'+','-'),
    opt('[',
        loop(line(choice(None, '+','-','/id'), opt('=', choice(None, '/id'))),' '),
    ),
    loop('/value', ' '),
    choice(
        None,
        line(loop(line(opt(choice(None, '/id'), '='),choice(None,'+','-', '/id')), ' '),
        ']')
    ),
    choice(None,'+','-')
)
