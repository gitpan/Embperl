
$r = shift ;

%messages =
    (
    'de' =>
        {
        'addsel1' => 'Klicken Sie auf die Kategorie zu der Sie etwas hinzuf�gen m�chten:',
        'addsel2' => 'oder f�gen Sie eine neue Kategorie hinzu. Bitte geben Sie die Beschreibung in so vielen Sprachen wie Ihnen m�glich ein.',
        'addsel3' => 'Falls Sie die �bersetzung nicht wissen, lassen Sie das entsprechende Eingabefeld leer.',
        'addsel4' => 'Kategorie hinzuf�gen',
        'add1'    => 'Hinzuf�gen eines neuen Eintrages zu',
        'add2'    => 'Bitte geben Sie die Beschreibung in so vielen Sprachen wie Ihnen m�glich ein.\<br\>Falls Sie die �bersetzung nicht wissen, lassen Sie das entsprechende Eingabefeld leer.',
        'add3'    => 'Hinzuf�gen zu',
        'heading' => '�berschrift',
        'url'     => 'URL',
        'description'  => 'Beschreibung',
        'show2'   => 'Folgender Eintrag wurde erfolgreich der Datenbank hinzugef�gt',
        },
    'en' =>
        {
        'addsel1' => 'Click on the category for wich you want to add a new item:',
        'addsel2' => 'or add new category. Please enter the description in as much languages as possible.',
        'addsel3' => 'If you don\'t know the translation leave the corresponding input field empty.',
        'addsel4' => 'Add category',
        'add1'    => 'Add a new item to',
        'add2'    => 'Please enter the description in as much languages as possible.<br>If you don\'t know the translation leave the corresponding input field empty.',
        'add3'    => 'Add to',
        'heading' => 'Heading',
        'url'     => 'URL',
        'description'  => 'Description',
        'show2'   => 'The following entry has been sucessfully added to the database',
        },
    ) ;


$lang = $r -> param -> language ;
push @{$r -> messages}, $messages{$lang} ;
push @{$r -> default_messages}, $messages{'en'} if ($lang ne 'en') ;
    

