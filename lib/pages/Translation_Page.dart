import 'package:flutter/material.dart';
import 'package:pdf_translator/pages/Final.dart';
//import 'package:pdftranslator/components/Rounded_Button.dart';

class Translation extends StatefulWidget {
  final String pdfName;
  Translation({this.pdfName});
  @override
  _TranslationState createState() => _TranslationState();
}

class _TranslationState extends State<Translation> {
  // final _formKey = GlobalKey<FormState>();
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  String dropdownValue = 'English en';
  String dropdownValue2 = 'Gujarati gu';
  bool hint = true;
  bool hint2 = true;
  @override
  // void initState() {
  // super.initState();
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Color(0xff03fcc2)],
            begin: Alignment.topLeft,
            stops: [0.01, 1],
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: Text(
                'PDF Translator',
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 60),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(90),
                      topRight: Radius.circular(80)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 60),
                    DropdownButton<String>(
                      //hint:Text(hint1),
                      hint: hint
                          ? Text('Select Language From')
                          : Text(dropdownValue),
                      icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                          hint = false;
                        });
                      },
                      items: <String>[
                        'Afrikaans	af',
                        'Albanian	sq',
                        'Amharic	am',
                        'Arabic	ar',
                        'Armenian	hy',
                        'Azerbaijani	az',
                        'Basque	eu',
                        'Belarusian	be',
                        'Bengali	bn',
                        'Bosnian	bs',
                        'Bulgarian	bg',
                        'Catalan	ca',
                        'Cebuano	ceb ',
                        'Chinese (Simplified)	zh-CN ',
                        'Chinese (Traditional)	zh-TW ',
                        'Corsican	co',
                        'Croatian	hr',
                        'Czech	cs',
                        'Danish	da',
                        'Dutch	nl',
                        'English en',
                        'Esperanto	eo',
                        'Estonian	et',
                        'Finnish	fi',
                        'French	fr',
                        'Frisian	fy',
                        'Galician	gl',
                        'Georgian	ka',
                        'German	de',
                        'Greek	el',
                        'Gujarati	gu',
                        'Haitian Creole	ht',
                        'Hausa	ha',
                        'Hawaiian	haw (ISO-639-2)',
                        'Hebrew	he or iw',
                        'Hindi	hi',
                        'Hmong	hmn (ISO-639-2)',
                        'Hungarian	hu',
                        'Icelandic	is',
                        'Igbo	ig',
                        'Indonesian	id',
                        'Irish	ga',
                        'Italian	it',
                        'Japanese	ja',
                        'Javanese	jv',
                        'Kannada	kn',
                        'Kazakh	kk',
                        'Khmer	km',
                        'Kinyarwanda	rw',
                        'Korean	ko',
                        'Kurdish	ku',
                        'Kyrgyz	ky',
                        'Lao	lo',
                        'Latin	la',
                        'Latvian	lv',
                        'Lithuanian	lt',
                        'Luxembourgish	lb',
                        'Macedonian	mk'
                            'Malagasy	mg',
                        'Malay	ms',
                        'Malayalam	ml',
                        'Maltese	mt',
                        'Maori	mi',
                        'Marathi	mr',
                        'Mongolian	mn',
                        'Myanmar (Burmese)	my',
                        'Nepali	ne',
                        'Norwegian	no',
                        'Nyanja (Chichewa)	ny',
                        'Odia (Oriya)	or',
                        'Pashto	ps',
                        'Persian	fa',
                        'Polish	pl',
                        'Portuguese (Portugal, Brazil)	pt',
                        'Punjabi	pa',
                        'Romanian	ro',
                        'Russian	ru',
                        'Samoan	sm',
                        'Scots Gaelic	gd',
                        'Serbian	sr',
                        'Sesotho	st',
                        'Shona	sn',
                        'Sindhi	sd',
                        'Sinhala (Sinhalese)	si',
                        'Slovak	sk',
                        'Slovenian	sl',
                        'Somali	so',
                        'Spanish	es',
                        'Sundanese	su',
                        'Swahili	sw',
                        'Swedish	sv',
                        'Tagalog (Filipino)	tl',
                        'Tajik	tg',
                        'Tamil	ta',
                        'Tatar	tt',
                        'Telugu	te',
                        'Thai	th',
                        'Turkish	tr',
                        'Turkmen	tk',
                        'Ukrainian	uk',
                        'Urdu	ur',
                        'Uyghur	ug',
                        'Uzbek	uz',
                        'Vietnamese	vi',
                        'Welsh	cy',
                        'Xhosa	xh',
                        'Yiddish	yi',
                        'Yoruba	yo',
                        'Zulu	zu',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        SizedBox(width: 175),
                        Icon(Icons.arrow_downward_outlined),
                        Icon(Icons.arrow_upward_rounded),
                      ],
                    ),
                    DropdownButton<String>(
                      //hint:Text(hint2),
                      hint: hint2
                          ? Text('Select Language To')
                          : Text(dropdownValue2),
                      icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue1) {
                        setState(() {
                          dropdownValue2 = newValue1;
                          hint2 = false;
                        });
                      },
                      items: <String>[
                        'Afrikaans	af',
                        'Albanian	sq',
                        'Amharic	am',
                        'Arabic	ar',
                        'Armenian	hy',
                        'Azerbaijani	az',
                        'Basque	eu',
                        'Belarusian	be',
                        'Bengali	bn',
                        'Bosnian	bs',
                        'Bulgarian	bg',
                        'Catalan	ca',
                        'Cebuano	ceb ',
                        'Chinese (Simplified)	zh-CN ',
                        'Chinese (Traditional)	zh-TW ',
                        'Corsican	co',
                        'Croatian	hr',
                        'Czech	cs',
                        'Danish	da',
                        'Dutch	nl',
                        'English	en',
                        'Esperanto	eo',
                        'Estonian	et',
                        'Finnish	fi',
                        'French	fr',
                        'Frisian	fy',
                        'Galician	gl',
                        'Georgian	ka',
                        'German	de',
                        'Greek	el',
                        'Gujarati	gu',
                        'Haitian Creole	ht',
                        'Hausa	ha',
                        'Hawaiian	haw (ISO-639-2)',
                        'Hebrew	he or iw',
                        'Hindi	hi',
                        'Hmong	hmn (ISO-639-2)',
                        'Hungarian	hu',
                        'Icelandic	is',
                        'Igbo	ig',
                        'Indonesian	id',
                        'Irish	ga',
                        'Italian	it',
                        'Japanese	ja',
                        'Javanese	jv',
                        'Kannada	kn',
                        'Kazakh	kk',
                        'Khmer	km',
                        'Kinyarwanda	rw',
                        'Korean	ko',
                        'Kurdish	ku',
                        'Kyrgyz	ky',
                        'Lao	lo',
                        'Latin	la',
                        'Latvian	lv',
                        'Lithuanian	lt',
                        'Luxembourgish	lb',
                        'Macedonian	mk'
                            'Malagasy	mg',
                        'Malay	ms',
                        'Malayalam	ml',
                        'Maltese	mt',
                        'Maori	mi',
                        'Marathi	mr',
                        'Mongolian	mn',
                        'Myanmar (Burmese)	my',
                        'Nepali	ne',
                        'Norwegian	no',
                        'Nyanja (Chichewa)	ny',
                        'Odia (Oriya)	or',
                        'Pashto	ps',
                        'Persian	fa',
                        'Polish	pl',
                        'Portuguese (Portugal, Brazil)	pt',
                        'Punjabi	pa',
                        'Romanian	ro',
                        'Russian	ru',
                        'Samoan	sm',
                        'Scots Gaelic	gd',
                        'Serbian	sr',
                        'Sesotho	st',
                        'Shona	sn',
                        'Sindhi	sd',
                        'Sinhala (Sinhalese)	si',
                        'Slovak	sk',
                        'Slovenian	sl',
                        'Somali	so',
                        'Spanish	es',
                        'Sundanese	su',
                        'Swahili	sw',
                        'Swedish	sv',
                        'Tagalog (Filipino)	tl',
                        'Tajik	tg',
                        'Tamil	ta',
                        'Tatar	tt',
                        'Telugu	te',
                        'Thai	th',
                        'Turkish	tr',
                        'Turkmen	tk',
                        'Ukrainian	uk',
                        'Urdu	ur',
                        'Uyghur	ug',
                        'Uzbek	uz',
                        'Vietnamese	vi',
                        'Welsh	cy',
                        'Xhosa	xh',
                        'Yiddish	yi',
                        'Yoruba	yo',
                        'Zulu	zu',
                      ].map<DropdownMenuItem<String>>((String value1) {
                        return DropdownMenuItem<String>(
                          value: value1,
                          child: Text(value1),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 25),
                    Row(
                      children: [
                        SizedBox(width: 180),
                        Icon(Icons.picture_as_pdf_rounded,
                            color: Colors.blueGrey, size: 50),
                      ],
                    ),
                    SizedBox(height:15),
                    Text(widget.pdfName,style:TextStyle(
                      fontSize:25,
                      color:Color(0xff2d9c6f),
                    )
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Material(
                        elevation: 5.0,
                        color: Color(0xff2d9c6f),
                        borderRadius: BorderRadius.circular(30.0),
                        child: MaterialButton(
                          onPressed: () {
                            hint || hint2
                                ? showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                    title: Text(
                                        'Select languages in order to translate.'),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(
                                                context, false);
                                          },
                                          child: Text('OK')),
                                    ]))
                                : Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Translated(
                                      pdfname:widget.pdfName,
                                    )
                                )
                            );
                          },
                          minWidth: 200.0,
                          height: 42.0,
                          child: Text(
                            'Translate',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
