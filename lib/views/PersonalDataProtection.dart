import 'package:flutter/material.dart';
import 'package:path/path.dart';

class PersonalDataProtection extends StatelessWidget {
  PersonalDataProtection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              child: Image(image: AssetImage("assets/logo.png")),
              padding: EdgeInsets.all(5),
            )
          ],
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Защита персональных данных",
            style: TextStyle(color: Colors.white),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    const Color(0xFFE51D08),
                    const Color(0xFFf2b11a),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(0.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
          backgroundColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10),
        ),
        body: Policy());
  }
}

class Policy extends StatelessWidget {
  const Policy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Text(
            "Политика конфиденциальности",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        ),
        Container(
          child: Text(
            "Политика ООО «Маяк» в отношении обработки персональных данных",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          alignment: Alignment.topLeft,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
              """Юридический адрес ООО «Маяк»: 664081, Иркутская область, г. Иркутск, ул.
Депутатская, д. 84/1, помещение 2."""),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
              """Фактический адрес ООО «Маяк»: 664074, Иркутская область, г. Иркутск, ул.
Лермонтова, 78."""),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """1. Назначение и область действия документа""",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
        ),
        Container(
          child: Text(
            """1. «Политика ООО «Маяк» (далее по тексту также — Общество) в отношении обработки персональных данных» (далее — Политика)
определяет позицию и намерения Общества в области обработки и защиты персональных данных, с целью соблюдения и защиты прав и свобод каждого человека и, в особенности, права на неприкосновенность частной жизни, личную и семейную тайну, защиту своей чести и доброго имени.""",
          ),
          padding: EdgeInsets.fromLTRB(50, 10, 10, 0),
        ),
        Container(
          child: Text(
            """2. Политика неукоснительно исполняется руководителями и работниками всех структурных подразделений и филиалов ООО
«Маяк».""",
          ),
          padding: EdgeInsets.fromLTRB(50, 10, 10, 0),
        ),
        Container(
          child: Text(
            """3. Действие Политики распространяется на все персональные данные субъектов, обрабатываемые в Обществе с применением средств автоматизации и без применения таких средств.""",
          ),
          padding: EdgeInsets.fromLTRB(50, 10, 10, 0),
        ),
        Container(
          child: Text(
            """4. К настоящей Политике имеет доступ любой субъект персональных данных.""",
          ),
          padding: EdgeInsets.fromLTRB(50, 10, 10, 0),
        ),
        Container(
          child: Text(
            """2. Определения""",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
        ),
        Container(
          child: Text(
            """1. Персональные данные — любая информация, относящаяся к прямо или косвенно определенному или определяемому физическому лицу (гражданину). Т.е. к такой информации, в частности, можно отнести: ФИО, год, месяц, дата и место рождения, адрес, сведения о семейном, социальном, имущественном положении, сведения об образовании, профессии, доходах, сведения о состоянии здоровья, а также другую информацию.""",
          ),
          padding: EdgeInsets.fromLTRB(50, 10, 10, 0),
        ),
        Container(
          child: Text(
            """2. Обработка персональных данных — любое действие (операция) или совокупность действий (операций) с персональными данным,
совершаемых с использованием средств автоматизации или без использования таких средств. К таким действиям (операциям) можно отнести: сбор, получение, запись, систематизацию, накопление, хранение, уточнение (обновление, изменение), извлечение, использование, передачу (распространение, предоставление, доступ), обезличивание, блокирование, удаление, уничтожение персональных данных.""",
          ),
          padding: EdgeInsets.fromLTRB(50, 10, 10, 0),
        ),
        Container(
          child: Text(
            """3. Субъекты персональных данных ООО «Маяк» обрабатывает персональные данные следующих лиц:""",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- Работников ООО "Маяк";""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- субъектов, с которыми заключены договоры гражданско-правового характера;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- кандидатов на замещение вакантных должностей ООО «Маяк»;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- зарегистрированных пользователей сайта ООО «Маяк»;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- представителей юридических лиц;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- поставщиков (индивидуальных предпринимателей).""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """4. Принципы и условия обработки персональных данных""",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
        ),
        Container(
          child: Text(
            """1. Под безопасностью персональных данных ООО «Маяк» понимает защищенность персональных данных от неправомерного или
случайного доступа к ним, уничтожения, изменения, блокирования, копирования, предоставления, распространения персональных данных, а также от иных неправомерных действий в отношении персональных данных и принимает необходимые правовые, организационные и технические меры для защиты персональных данных.""",
          ),
          padding: EdgeInsets.fromLTRB(50, 10, 10, 0),
        ),
        Container(
          child: Text(
            """2. Обработка и обеспечение безопасности персональных данных в ООО «Маяк» осуществляется в соответствии с требованиями Конституции Российской Федерации, Федерального закона № 152-ФЗ «О персональных данных», подзаконных актов, других определяющих
случаи и особенности обработки персональных данных федеральных законов Российской Федерации, руководящих и методических документов ФСТЭК России и ФСБ России.""",
          ),
          padding: EdgeInsets.fromLTRB(50, 10, 10, 0),
        ),
        Container(
          child: Text(
            """3. При обработке персональных данных ООО «Маяк» придерживается следующих принципов:""",
          ),
          padding: EdgeInsets.fromLTRB(50, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- законности и справедливой основы;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- ограничения обработки персональных данных достижением конкретных, заранее определенных и законных целей;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- недопущения обработки персональных данных, несовместимой с целями сбора персональных данных;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- недопущения объединения баз данных, содержащих персональные данные, обработка которых осуществляется в целях, несовместимых между собой;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- обработки персональных данных, которые отвечают целям их обработки;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- соответствия содержания.""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """4. Общество обрабатывает персональные данные только при наличии хотя бы одного из следующих условий:""",
          ),
          padding: EdgeInsets.fromLTRB(50, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- обработка персональных данных осуществляется с согласия субъекта персональных данных на обработку его персональных данных;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- обработка персональных данных необходима для достижения целей, предусмотренных законом, для осуществления и выполнения возложенных законодательством Российской Федерации на оператора функций, полномочий и обязанностей;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- обработка персональных данных необходима для исполнения договора, стороной которого либо выгодоприобретателем или поручителем по которому является субъект персональных данных, а также для заключения договора по инициативе субъекта персональных данных или договора, по которому субъект персональных данных будет являться выгодоприобретателем или поручителем;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- обработка персональных данных необходима для осуществления прав и законных интересов Общества или третьих лиц либо для достижения общественно значимых целей при условии, что при этом не нарушаются права и свободы субъекта персональных данных;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- осуществляется обработка персональных данных, доступ неограниченного круга лиц к которым предоставлен субъектом персональных данных либо по его просьбе;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- осуществляется обработка персональных данных, подлежащих опубликованию или обязательному раскрытию в соответствии с федеральным законом.""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """5. ООО «Маяк» вправе поручить обработку персональных данных граждан третьим лицам, на основании заключаемого с этими лицами договора.""",
          ),
          padding: EdgeInsets.fromLTRB(50, 10, 10, 0),
        ),
        Container(
          child: Text(
            """6. Лица, осуществляющие обработку персональных данных по поручению ООО «Маяк», обязуются соблюдать принципы и правила обработки и защиты персональных данных, предусмотренные Федеральным законом № 152-ФЗ «О персональных данных». Для каждого лица определены перечень действий (операций) с персональными данными, которые будут совершаться юридическим лицом, осуществляющим обработку персональных данных, цели обработки, установлена обязанность такого лица соблюдать конфиденциальность и обеспечивать безопасность персональных данных при их обработке, а также указаны требования к защите обрабатываемых персональных данных.""",
          ),
          padding: EdgeInsets.fromLTRB(50, 10, 10, 0),
        ),
        Container(
          child: Text(
            """7. В случаях, установленных законодательством Российской Федерации, ООО «Маяк» вправе осуществлять передачу персональных данных граждан.""",
          ),
          padding: EdgeInsets.fromLTRB(50, 10, 10, 0),
        ),
        Container(
          child: Text(
            """8. В целях информационного обеспечения в Общества могут создаваться общедоступные источники персональных данных работников, в том числе справочники и адресные книги. В общедоступные источники персональных данных с согласия работника могут включаться его фамилия, имя, отчество, дата и место рождения, должность, номера контактных телефонов, адрес электронной почты. Сведения о работнике должны быть в любое время исключены из общедоступных источников персональных данных по требованию работника либо по решению суда или иных уполномоченных государственных органов.""",
          ),
          padding: EdgeInsets.fromLTRB(50, 10, 10, 0),
        ),
        Container(
          child: Text(
            """9. Общество уничтожает либо обезличивает персональные данные по достижении целей обработки или в случае утраты необходимости
достижения цели обработки.""",
          ),
          padding: EdgeInsets.fromLTRB(50, 10, 10, 0),
        ),
        Container(
          child: Text(
            """5. Права субъекта персональных данных""",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
        ),
        Container(
          child: Text(
            """Гражданин, персональные данные которого обрабатываются ООО «Маяк», имеет право:""",
          ),
          padding: EdgeInsets.fromLTRB(50, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- получать от ООО «Маяк»:""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- подтверждение факта обработки персональных данных ООО «Маяк»;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- правовые основания и цели обработки персональных данных;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- сведения о применяемых ООО «Маяк» способах обработки персональных данных;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- наименование и местонахождения ООО «Маяк»;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- сведения о лицах, которые имеют доступ к персональным данным или которым могут быть раскрыты персональные данные на основании договора с ООО «Маяк» или на основании федерального закона;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- перечень обрабатываемых персональных данных, относящихся к гражданину, от которого поступил запрос и источник их получения, если иной порядок предоставления таких данных не предусмотрен федеральным законом;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- сведения о сроках обработки персональных данных, в том числе о сроках их хранения;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- сведения о порядке осуществления гражданином прав, предусмотренных Федеральным законом «О персональных данных» № 152-ФЗ;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- информацию об осуществляемой или о предполагаемой трансграничной передаче персональных данных;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- наименование и адрес лица, осуществляющего обработку персональных данных по поручению ООО «Маяк»;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- иные сведения, предусмотренные Федеральным законом «О персональных данных» № 152-ФЗ или другими федеральными законами;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- требовать уточнения своих персональных данных, их блокирования или уничтожения в случае, если персональные данные являются неполными, устаревшими, неточными, незаконно полученными или не являются необходимыми для заявленной цели обработки;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- отозвать свое согласие на обработку персональных данных;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- требовать устранения неправомерных действий ООО «Маяк» в отношении его персональных данных;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- обжаловать действия или бездействие ООО «Маяк» в Федеральную службу по надзору в сфере связи, информационных технологий и массовых коммуникаций (Роскомнадзор) или в судебном порядке в случае, если гражданин считает, что ООО «Маяк» осуществляет обработку его персональных данных с нарушением требований Федерального закона № 152-ФЗ «О персональных данных» или иным образом нарушает его права и свободы;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- на защиту своих прав и законных интересов, в том числе на возмещение убытков и/или компенсацию морального вреда в судебном порядке.""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """6. Ответственность""",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
        ),
        Container(
          child: Text(
            """В случае неисполнения положений настоящей Политики ООО «Маяк» несет ответственность в соответствии действующим законодательством Российской Федерации.""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """На сайте www.shop.slata.ru публикуется актуальная версия «Политики «ООО «Маяк» в отношении обработки персональных данных».""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """Сведения о реализуемых требованиях к защите персональных данных""",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """ООО «Маяк» при обработке персональных данных принимает необходимые правовые, организационные и технические меры для защиты персональных данных от неправомерного или случайного доступа к ним, уничтожения, изменения, блокирования, копирования, предоставления, распространения персональных данных, а также от иных неправомерных действий в отношении персональных данных.""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """К таким мерам в соответствии с Федеральным законом № 152-ФЗ «О персональных данных» относятся:""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- определение угроз безопасности персональных данных при их обработке в информационных системах персональных данных;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- применение организационных и технических мер по обеспечению безопасности персональных данных при их обработке в информационных системах персональных данных, необходимых для выполнения требований к защите персональных данных, исполнение которых обеспечивает установленные Правительством Российской Федерации уровни защищенности персональных данных;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- применение прошедших в установленном порядке процедуру оценки соответствия средств защиты информации;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- оценка эффективности принимаемых мер по обеспечению безопасности персональных данных до ввода в эксплуатацию информационной системы персональных данных;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- обнаружение фактов несанкционированного доступа к персональным данным и принятием мер;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- восстановление персональных данных, модифицированных или уничтоженных вследствие несанкционированного доступа к ним;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- установление правил доступа к персональным данным, обрабатываемым в информационной системе персональных данных, а также обеспечением регистрации и учета всех действий, совершаемых с персональными данными в информационной системе персональных данных;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- контроль за принимаемыми мерами по обеспечению безопасности персональных данных и уровня защищенности информационных систем персональных данных;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- учет машинных носителей персональных данных;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- организация пропускного режима на территорию Общества;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- размещение технических средств обработки персональных данных в пределах охраняемой территории;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- поддержание технических средств охраны, сигнализации в постоянной готовности;""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container(
          child: Text(
            """- проведение мониторинга действий пользователей, проведение разбирательств по фактам нарушения требований безопасности персональных данных""",
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        )
      ],
    );
  }
}
