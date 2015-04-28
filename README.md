# Lixr
LIX - Läsbarhetsindex, a TinyMce plugin
Läsbarhetsindex (LIX) kan användas för att få uppfattning om hur lätt eller svår en text är att läsa. LIX är baserat på medeltalet ord per mening och andelen långa ord (ord med fler än 6 bokstäver) uttryckt i procent.

##Kom igång
När du lagt in paketet i ditt egna projekt kommmer det under Admin - Redigera egenskapstyper - XHtmlString, läggas upp en knapp för Vaidera text.
Du kan välj att dra in denna i dina default-settings. Har du skapat en egen setting via kod (PropertySettings<TinyMCESettings>) så använder du
namnet Settings.ToolbarRows.Add(new ToolbarRow(new[] { "validatetextbutton"})) för att lägga till knappen.

##Inställningar

I filen LixFrame.aspx refereras jquery in via https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js.
Ändra denna till din egna variant av jquery. Där kan även style anpassas till det egna projektet.
