import 'package:app_provee/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/repository/user_repository.dart';
import '../ui/pages/register_user/register_user_page_contact.dart';
import '../ui/pages/register_user/register_user_page_email.dart';
import '../ui/pages/register_user/register_user_page_message.dart';
import '../ui/pages/register_user/register_user_page_term.dart';
import '../ui/themes/helper_theme.dart';
import '../ui/utils/snackbar_util.dart';
import 'global_controller.dart';

class RegisterUserController extends GetxController {
  RxBool isChecked = true.obs;

  RxString typeDocument = 'DNI'.obs;
  final numberController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();

  FocusNode numberFocusNode = FocusNode();
  FocusNode firstnameFocusNode = FocusNode();
  FocusNode lastnameFocusNode = FocusNode();

  final globalController = Get.find<GlobalController>();

  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  FocusNode addressFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();

  final codeController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  FocusNode codeFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode passwordConfirmFocusNode = FocusNode();

  RxBool showPasswordConfirm = true.obs;
  RxBool showPassword = true.obs;
  List<Widget> terms = const [
    Text(
      'TÉRMINOS Y CONDICIONES DE USO DE LA PÁGINA WEB',
      style: HelperTheme.termTitle,
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'El presente documento contiene Las Condiciones de Uso de la Página Web, en adelante "Las Condiciones", que regulan la utilización de la Página Web www.provee.com.pe en adelante "La Web", que ha puesto a disposición de los usuarios MD PERU BUSINESS EIRL., con RUC 20606603089, con domicilio en Av. Cristóbal peralta 1427, valle hermoso – Surco, Lima, en adelante "PROVEE"',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Cualquier persona que desee acceder y/o suscribirse y/o usar el Sitio o los Servicios podrá hacerlo sujetándose a los Términos y Condiciones Generales, junto con todas las demás políticas y principios que rige PROVEE y que son incorporados al presente directamente o por referencia o que son explicados y/o detallados en otras secciones del Sitio. En consecuencia, todas las visitas y todos los contratos y transacciones que se realicen en este Sitio, así como sus efectos jurídicos, quedarán regidos por estas reglas y sometidos a la legislación aplicable en Perú.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Se deja establecido que el acceso y utilización de La Web supone la aceptación de Las Condiciones, sin requerirse declaración adicional alguna del usuario.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'PROVEE se compromete a publicar Las Condiciones en La Web, y sus modificatorias que se realicen posteriormente, para conocimiento de sus usuarios.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'CUALQUIER PERSONA QUE NO ACEPTE ESTOS TÉRMINOS Y CONDICIONES GENERALES, LOS CUALES TIENEN UN CARÁCTER OBLIGATORIO Y VINCULANTE, DEBERÁ ABSTENERSE DE UTILIZAR EL SITIO Y/O LOS SERVICIOS.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'El usuario debe leer, entender y aceptar todas las condiciones establecidas en los Términos y Condiciones Generales, previo a su inscripción como afiliado de PROVEE.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Text(
      'DE LOS USUARIOS',
      style: HelperTheme.termTitle,
      textAlign: TextAlign.justify,
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Se considera usuario a toda persona natural o jurídica que haga uso de La Web, entendiéndose como tal desde el momento del acceso. Los usuarios que accedan a la Web, declaran conocer y aceptar Las Condiciones, así como la legislación aplicable en el Perú y las consecuencias que generan el acceso y uso de la misma. Así mismo se considerará usuario comprador a aquel usuario que realice una compra por este medio y usuario vendedor al que realice una venta por dicho medio.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'PROVEE no controla ni ofrece ninguna clase de garantía sobre la identidad de los usuarios, ni sobre la veracidad, vigencia y autenticidad de los datos que los afiliados proporcionan sobre sí mismos no responsabilizándose así por los daños y perjuicios de toda naturaleza que puedan deberse a la incorrecta identidad de los afiliados y a la falta de veracidad, vigencia y autenticidad de la información que los afiliados proporcionan acerca de sí mismos o hacen accesibles para otros comerciantes.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'GRATUIDAD Y NO EXIBILIDAD DE REGISTRO',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'El acceso y/o utilización de La Web, es gratuito. En caso que, se solicite el registro de información y datos personales a los usuarios, éste no será de carácter obligatorio, y no condicionará el acceso a los servicios que brinda La Web. El usuario declara y acepta que toda la información que proporciona a PROVEE, es veraz, actual y exacta, exonerándose PROVEE de cualquier responsabilidad al respecto.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Asimismo, deberá entenderse que cualquier información, comentario, sugerencia, material, etc., proporcionado por el usuario es de carácter no confidencial o secreto; por lo cual PROVEE se encuentra facultada de manera irrevocable y sin restricción alguna, al uso ilimitado del mismo acorde a ley. ',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '01 - CAPACIDAD',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Los Servicios sólo están disponibles para persona natural o jurídica que tengan capacidad legal para contratar (en adelante, el “usuario”, o en plural, los “usuarios”). No podrán utilizar los Servicios las personas que no tengan esa capacidad y los menores de edad. Para registrar un usuario vendedor como Empresa, se deberá contar con la capacidad suficiente como para contratar a nombre y representación de tal entidad como así también de obligar a la misma en los términos de este Acuerdo.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '02 - REGISTRACIÓN',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Es obligatorio completar el formulario de registración en todos sus campos con datos válidos para poder utilizar los servicios que brinda PROVEE. El usuario deberá completar el mencionado formulario de registración con la información personal que le sea solicitada de manera exacta, precisa y verdadera (en adelante, los "Datos Personales") y asume el compromiso de actualizar los Datos Personales conforme resulte necesario. El usuario presta expresa conformidad con que PROVEE utilice diversos medios para identificar sus datos personales, asumiendo el usuario la obligación de revisarlos y mantenerlos actualizados. Los datos personales de los usuarios (nombres, DNI, carnet de extranjería) serán validados por el área administrativa de PROVEE, siendo aprobada o rechazada por el mismo',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'El usuario accederá a su cuenta personal (en adelante, la "Cuenta") mediante el ingreso de su usuario y clave de seguridad personal elegida (en adelante, la "Clave de Seguridad"). El usuario se obliga a mantener la confidencialidad de su Clave de Seguridad.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'La Cuenta es personal, única e intransferible. El usuario será responsable por todas las operaciones efectuadas en su Cuenta, pues el acceso a la misma está restringido al ingreso y uso de su Clave de Seguridad, de conocimiento exclusivo del usuario. ',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '03 - MODIFICACIONES DEL ACUERDO',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'PROVEE podrá modificar los Términos y Condiciones Generales en cualquier momento haciendo públicos en el Sitio los términos modificados. Dichas modificaciones serán comunicadas por PROVEE a los usuarios que en la Configuración de su Cuenta hayan indicado que desean recibir notificaciones de los cambios en estos Términos y Condiciones. Todo usuario que no esté de acuerdo con las modificaciones efectuadas podrá solicitar la baja de su Cuenta.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'El uso del Sitio y/o sus Servicios implica la plena aceptación de estos Términos y Condiciones Generales, como así también de cualquiera de las demás políticas, anexos y principios que rigen en PROVEE.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '04 - LISTADO DE BIENES',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '4.1. Medios de pago',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Los productos y servicios ofrecidos en el Sitio, sólo pueden ser pagados con los medios que en cada caso específicamente se indiquen (transferencias bancarias y plataformas digitales de pago como yape y plin). El uso de tarjetas de créditos o débito se sujetará a lo establecido en estos Términos y Condiciones y, en relación con su emisor, y a lo pactado en los respectivos Contratos de Apertura y Reglamento de Uso. Tratándose de tarjetas bancarias aceptadas en el Sitio, los aspectos relativos a éstas, tales como la fecha de emisión, caducidad, cupo, bloqueos, cobros de comisiones, interés de compra en cuotas etc. Las transferencias interbancarias se verán reflejas 24 horas luego de realizado el pago, luego de ello se procederá a la conformidad del mismo.  El Sitio podrá indicar determinadas condiciones de compra según el medio de pago que se utilice por el usuario.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Al utilizar una tarjeta de crédito o débito, el nombre del titular de dicha tarjeta debe coincidir con el nombre utilizado al registrarse en el portal de PROVEE. De lo contrario, se podría anular la operación. Bajo cualquier sospecha y/o confirmación de compras no autorizadas PROVEE cancelará la compra, efectuará el reverso a la tarjeta de forma automática y estará facultado para iniciar acciones judiciales en contra del afiliado que haya llevado a cabo la transacción sospechosa. Así mismo, PROVEE podrá en los términos de la ley, entregar la información personal de quien haya realizado la transacción sospechosa a los tarjetahabientes afectados. ',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '4.2. Publicación de bienes y/o servicios',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'El usuario vendedor deberá ofrecer a la venta los bienes y/o servicios en las categorías apropiadas. Las publicaciones podrán incluir textos descriptivos, gráficos, fotografías y otros contenidos y condiciones pertinentes para la venta del bien o la contratación del servicio, siempre que no violen ninguna disposición de este acuerdo o demás políticas de PROVEE. El producto ofrecido por el usuario vendedor debe ser exactamente descrito en cuanto a sus condiciones y características relevantes. Se entiende y presume que mediante la inclusión del bien o servicio en PROVEE, el usuario comprador acepta que tiene la intención y el derecho de vender el bien por él ofrecido, o está facultado para ello por su titular y lo tiene disponible para su entrega inmediata. Se establece que los precios de los productos publicados deberán ser expresados con IGV incluido cuando corresponda la aplicación del mismo, y en moneda del curso legal (soles). PROVEE podrá remover cualquier publicación cuyo precio no sea expresado de esta forma para evitar confusiones o malentendidos en cuanto al precio final del producto. Se deja expresamente establecido que ninguna descripción podrá contener datos personales o de contacto, tales como, y sin limitarse a, números telefónicos, dirección de e-mail, dirección postal, direcciones de páginas de Internet que contengan datos como los mencionados anteriormente. No podrá publicitarse otros medios de pagos, distintos de los enunciados por PROVEE en la página de publicación de artículos. En caso que se infrinja cualquiera de las disposiciones establecidas en esta cláusula, PROVEE podrá editar el espacio, solicitar al comerciante que lo edite, o dar de baja la publicación donde se encuentre la infracción.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '4.3. Licencia sobre imágenes, fotografías, marcas e Información de Producto',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'El usuario comprador autoriza a PROVEE a utilizar, publicar, reproducir y/o adaptar las imágenes y fotografías incluidas en sus publicaciones, su nombre comercial, marcas, frases publicitarias, logos, diseños, dibujos, imágenes y todo otro signo distintivo que identifique al comerciante y sus productos o servicios (la "Marca") e información de sus productos o servicios ("Información de Producto"). Será obligación del usuario comprador incluir en las publicaciones las imágenes, fotografías y Marca, así como la Información de Producto, de manera actualizada, incluyendo aquellas advertencias que sean requeridas por la legislación aplicable para la venta o publicidad de los productos y servicios. Conforme a lo anterior, PROVEE podrá obtener las imágenes, fotografías, Marca e Información de Producto directamente del comerciante, terceros autorizados por éste, o a través del sitio web del comerciante.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'En particular, el usuario comprador otorga a PROVEE una autorización gratuita, irrevocable, no exclusiva, internacional y sin límite temporal para usar, publicar, reproducir y/o adaptar las imágenes, fotografías, la Marca y la Información de Producto con el fin de ser usadas en todos los sitios y aplicaciones de PROVEE, redes sociales y/o en cualquier medio masivo y no masivo de comunicación, incluyendo sin limitación, plataformas y cualquier otro medio digital o físico que PROVEE considere oportuno, para identificar ofertas, clasificar productos, crear catálogos, realizar acciones publicitarias y de marketing vinculadas a los servicios de PROVEE.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'El usuario comprador declara y garantiza que es titular de los derechos necesarios sobre las imágenes, fotografías contenidas en sus publicaciones, sobre las Marcas, así como sobre la Información de Producto, y que cuenta con los derechos y facultades necesarias para conceder la autorización detallada en esta cláusula, siendo responsable exclusivo por cualquier infracción a derechos de terceros o por las inconsistencias o inexactitud en la Información de Producto.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'PROVEE podrá eliminar la publicación de las imágenes y fotografías, e incluso del bien o servicio, si interpretara, a su exclusivo criterio, que la imagen no cumple con los presentes Términos y Condiciones. ',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '05 - PRIVACIDAD DE LA INFORMACIÓN',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Para utilizar los Servicios ofrecidos por PROVEE, los usuarios deberán facilitar determinados datos de carácter personal. Su información personal se procesa y almacena en servidores o medios magnéticos que mantienen altos estándares de seguridad y protección tanto física como tecnológica. ',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '06 - OBLIGACIONES DE LOS USUARIOS',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '6.1 USUARIO COMPRADOR',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Durante el plazo fijado por el usuario vendedor, los usuarios compradores interesados realizarán ofertas de compra para los bienes y ofertas de contratación para los servicios. La oferta de venta se cierra una vez que vence el plazo o se acaban las cantidades estipuladas por el usuario vendedor, mientras que la oferta de contratación del servicio culmina con el vencimiento del plazo de la publicación contratado.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'El usuario comprador sólo podrá comunicarse con el usuario vendedor una vez realizado el pago a PROVEE, quien proporcionará los datos del mismo para las coordinaciones respectivas.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Al ofertar por un artículo el usuario comprador acepta quedar obligado por las condiciones de venta incluidas en la descripción del artículo en la medida en que las mismas no infrinjan las leyes o los Términos y Condiciones Generales y demás políticas de PROVEE. La oferta de compra es irrevocable salvo en circunstancias excepcionales, tales como que el usuario comprador cambie sustancialmente la descripción del artículo después de realizada alguna oferta o que no pueda verificar la identidad del usuario vendedor.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Las ofertas de compra sólo serán consideradas válidas, una vez que hayan sido procesadas por el sistema informático de PROVEE. ',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Tal como lo establece la normativa fiscal vigente, el usuario comprador debe exigir factura o boleta de venta al usuario vendedor como comprobante de la operación.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '6.2 USUARIO VENDEDOR:',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'El usuario vendedor debe tener capacidad legal para vender el bien objeto de su oferta. Asimismo, debe cumplir con todas las obligaciones regulatorias pertinentes y contar con los registros, habilitaciones, permisos y/o autorizaciones exigidas por la normativa aplicable para la venta de los bienes y servicios ofrecidos.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'PROVEE tendrá el derecho de forzar, conforme los criterios que considere pertinentes, que ciertos usuarios vendedores solamente puedan cobrar el pago de sus artículos y de las tarifas que se puedan llegar a generarse por la utilización de los Servicios mediante la utilización de los Servicios de Gestión de Pagos online de PROVEE.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Dado que PROVEE es un punto de encuentro entre el usuario comprador y el usuario vendedor y no participa de las operaciones que se realizan entre ellos, el usuario vendedor será responsable por todas las obligaciones y cargas impositivas que correspondan por la venta de sus artículos, sin que pudiera imputársele a PROVEE algún tipo de responsabilidad por incumplimientos en tal sentido.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Cuando el usuario comprador haya recibido una oferta en un artículo por él publicado, deberá comunicar a la contraparte de acuerdo a lo establecido. ',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Impuestos. Como se mencionará anteriormente, PROVEE sólo pone a disposición de los usuarios vendedores un espacio virtual que les permite comunicarse mediante Internet para encontrar una forma de vender o comprar artículos y/o servicios a terceras personas o empresas. PROVEE no tiene participación alguna en el proceso de negociación y perfeccionamiento del contrato definitivo entre las partes. Por eso, PROVEE no es responsable por el efectivo cumplimiento de las obligaciones fiscales o impositivas establecidas por la ley vigente.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'El usuario vendedor acepta que el usuario comprador puede anular el pedido de manera inmediata por falla de Producto (Producto dañado, defectuoso, empaque en mal estado o roto, producto con señales de uso, accesorios faltantes, producto con características distintas a las ofrecidas, incumplimiento en los días de entrega).',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '07 - PROHIBICIONES',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '7.1 DEL USUARIO COMPRADOR',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Los usuarios compradores no podrán: (a) Solicitar rebaja sobre los precios establecidos; (b) Mantener cualquier tipo de comunicación por e-mail o por cualquier otro medio (incluyendo las redes sociales) durante la oferta del bien con ninguno de los usuarios vendedores que participan en la misma; (c) Solicitar los datos personales de los usuarios vendedores a través de la sección de Preguntas y Respuestas y/o por algún otro medio (incluyendo pero sin limitar a Twitter, Facebook y/ o cualquier otra red social); (d) Comprar  artículos prohibidos por los Términos y Condiciones Generales, demás políticas de PROVEE o leyes vigentes; (f) insultar o agredir a otros usuarios; (g) Utilizar su reputación, calificaciones o comentarios recibidos en el sitio de PROVEE en cualquier ámbito fuera de PROVEE; (i) publicar artículos idénticos en más de una publicación.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '7.2 DEL USUARIO VENDEDOR',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Los usuarios vendedores no podrán: (a) manipular los precios de los artículos; (b) interferir en la puja entre distintos usuarios; (c) mantener cualquier tipo de comunicación por e-mail o por cualquier otro medio (incluyendo las redes sociales) durante la oferta del bien con ninguno de los usuarios compradores que participan en la misma; (d) dar a conocer sus datos personales o de otros usuarios compradores a través de la sección de Preguntas y Respuestas y/o por algún otro medio (incluyendo pero sin limitar a Twitter, Facebook y/ o cualquier otra red social); (e) aceptar datos personales proporcionados por otros usuarios a través de la sección de Preguntas y Respuestas y/o algún otro medio (incluyendo pero sin limitar Twitter, Facebook y/o cualquier otra red social); (f) publicar o vender artículos prohibidos por los Términos y Condiciones Generales, demás políticas de PROVEE o leyes vigentes; (g) insultar o agredir a otros usuarios; (h) utilizar su reputación, calificaciones o comentarios recibidos en el sitio de PROVEE en cualquier ámbito fuera de PROVEE; (i) publicar artículos idénticos en más de una publicación.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '8. RESPONSABILIDAD DE PROVEE',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'PROVEE no será responsable por el funcionamiento de La Web en los siguientes casos:',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '1.	Caso fortuito o fuerza mayor.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '2.	Desperfectos, obsolescencia, falta de mantenimiento o manejo inadecuado de los equipos de los usuarios vinculados con el presente contrato.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '3.	Desperfectos ocasionados por virus o ataques de hackers o crackers que afecten el soporte electrónico vinculado con La Web;',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '4.	Incumplimiento por parte del usuario de lo establecido en Las Condiciones, y sus modificatorias.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '5.	Todas las obligaciones surgidas entre los usuarios, por uso de los diferentes servicios ofrecidos en La Web, es de responsabilidad sólo de las dos partes.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '6.	En general, cualquier causa que no sea directamente imputable a PROVEE.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'PROVEE sólo responderá de los daños y perjuicios causados al usuario comprador derivados del incumplimiento por dolo o culpa grave de las obligaciones previstas en estas condiciones.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Queda establecido que el usuario es el único responsable por el uso que haga de La Web. En este sentido, cualquier daño ocasionado por el uso directo o indirecto de La Web o de la información contenida en la misma, será de exclusiva responsabilidad del usuario, quedando PROVEE libre de cualquier responsabilidad al respecto.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '09 - VIOLACIONES DEL SISTEMA O BASES DE DATOS',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'No está permitida ninguna acción o uso de dispositivo, software, u otro medio tendiente a interferir tanto en las actividades y operatoria de PROVEE como en las ofertas, descripciones, cuentas o bases de datos de PROVEE. Cualquier intromisión, tentativa o actividad violatoria o contraria a las leyes sobre derecho de propiedad intelectual y/o a las prohibiciones estipuladas en este contrato harán pasible a su responsable de las acciones legales pertinentes, y a las sanciones previstas por este acuerdo, así como lo hará responsable de indemnizar los daños ocasionados.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '10 - SANCIONES. SUSPENSIÓN DE OPERACIONES',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'En el caso de la suspensión de un usuario vendedor, sea temporal o definitiva, todos los artículos que tuviera publicados serán removidos del sistema y en ningún caso se devolverán o bonificarán los cargos de publicación involucrados',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '11 - RESPONSABILIDAD',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'PROVEE sólo pone a disposición de los usuarios un espacio virtual que les permite ponerse en comunicación mediante Internet para encontrar una forma de comprar y vender servicios o bienes. PROVEE no es el propietario de los artículos ofrecidos, no tiene posesión de ellos ni los ofrece en venta. PROVEE no interviene en el perfeccionamiento de las operaciones realizadas entre los usuarios ni en las condiciones por ellos estipuladas para las mismas, por ello no será responsable respecto de la existencia, calidad, cantidad, estado, integridad o legitimidad de los bienes ofrecidos, adquiridos o enajenados por los usuarios, así como de la capacidad para contratar de los usuarios o de la veracidad de los Datos Personales por ellos ingresados. Cada usuario conoce y acepta ser el exclusivo responsable por los artículos que publica para su venta y por las ofertas y/o compras que realiza.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Debido a que PROVEE no tiene ninguna participación durante todo el tiempo en que el artículo se publica para la venta, ni en la posterior negociación y perfeccionamiento del contrato definitivo entre las partes, no será responsable por el efectivo cumplimiento de las obligaciones asumidas por los usuarios en el perfeccionamiento de la operación. El usuario comprador conoce y acepta que, al realizar operaciones con el usuario vendedor, lo hace bajo su propio riesgo. En ningún caso PROVEE será responsable por lucro cesante, o por cualquier otro daño y/o perjuicio que haya podido sufrir el usuario comprador, debido a las operaciones realizadas o no realizadas por artículos publicados a través de PROVEE.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'En caso que uno o más usuarios compradores inicien cualquier tipo de reclamo o acción legal contra otro u otros usuarios vendedores, todos y cada uno de los usuarios involucrados en dichos reclamos o acciones judiciales eximen de toda responsabilidad a PROVEE y a sus directores, gerentes, empleados, agentes, operarios, representantes y/o apoderados. Los usuarios compradores que no estén de acuerdo con la compra realizada pueden solicitar la devolución de su dinero, siempre y cuando corroboren la justificación del mismo. ',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'PROVEE recomienda actuar con prudencia y sentido común al momento de realizar operaciones con los usuarios compradores. El usuario vendedor debe tener presente, además, los riesgos de contratar con menores o con personas que se valgan de una identidad falsa. PROVEE NO será responsable por la realización de ofertas y/o operaciones con los usuarios, basadas en la confianza depositada en el sistema o los Servicios brindados por PROVEE.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '12 - ALCANCE DE LOS SERVICIOS DE PROVEE',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Este acuerdo no crea ningún contrato de sociedad, de mandato, de franquicia, o relación laboral entre PROVEE y el usuario. El usuario reconoce y acepta que PROVEE no es parte en ninguna operación, ni tiene control alguno sobre la calidad, seguridad o legalidad de los artículos anunciados, la veracidad o exactitud de los anuncios, la capacidad de los usuarios para comprar y/o vender artículos. PROVEE no puede asegurar que un usuario completará una operación ni podrá verificar la identidad o Datos Personales ingresados por los usuarios. PROVEE no garantiza la veracidad de la publicidad de terceros que aparezca en el sitio y no será responsable por la correspondencia o contratos que el usuario celebre con dichos terceros o con otros usuarios.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '13 - FALLAS EN EL SISTEMA',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'PROVEE no se responsabiliza por cualquier daño, perjuicio o pérdida generada al afiliado por fallas en el sistema, en el servidor o en la Internet. PROVEE tampoco será responsable por cualquier virus que pudiera infectar el equipo del usuario como consecuencia del acceso, uso o examen de su sitio web o a raíz de cualquier transferencia de datos, archivos, imágenes, textos, o audios contenidos en el mismo. Los usuarios NO podrán imputarle responsabilidad alguna ni exigir pago por lucro cesante, en virtud de perjuicios resultantes de dificultades técnicas o fallas en los sistemas o en Internet. PROVEE no garantiza el acceso y uso continuado o ininterrumpido de su sitio. El sistema puede eventualmente no estar disponible debido a dificultades técnicas o fallas de Internet, o por cualquier otra circunstancia ajena a PROVEE; en tales casos se procurará restablecerlo con la mayor celeridad posible sin que por ello pueda imputársele algún tipo de responsabilidad. PROVEE no será responsable por ningún error u omisión contenidos en su sitio web.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '14 - TARIFAS. FACTURACIÓN',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'La inscripción en PROVEE es gratuita. Provee pagará al usuario comprador, un porcentaje del 5% de comisión, depositado en su billetera virtual, por el importe total del producto comprado. Una vez reflejada la comisión, el usuario comprador podrá solicitar el retiro por medio de transferencia bancaria, para ello dicho afiliado tendrá que completar los datos solicitados para este trámite. PROVEE se reserva el derecho de modificar, cambiar, agregar, o eliminar las tarifas vigentes, en cualquier momento, lo cual será notificado a los usuarios compradores. Sin embargo, PROVEE podrá modificar temporalmente la Política de Tarifas y las tarifas por sus servicios por razón de promociones, siendo efectivas estas modificaciones cuando se haga pública la promoción o se realice el anuncio.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Provee aplicará un porcentaje de descuento de comisión por el importe total del producto vendido (15% hasta S/400.00 y 10% de S/401.00 a más), siendo el importe mínimo del producto a vender de S/10.00. El usuario vendedor acepta pagar a PROVEE los cargos antes mencionados utilizando la plataforma de PROVEE.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'A su exclusiva discreción, PROVEE podrá expedir en forma electrónica las facturas correspondientes a las comisiones, cargos y demás conceptos originados en el uso de los Servicios por parte de los usuarios vendedores. La aceptación de los Términos y Condiciones Generales por el usuario conlleva, entre otras cuestiones, el consentimiento expreso de éste a recibir las mencionadas facturas en forma electrónica.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'PROVEE se reserva el derecho de tomar las medidas judiciales y extrajudiciales que estime pertinentes para obtener el pago del monto debido.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '15 - SISTEMA DE REPUTACIÓN',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Los usuarios cuentan con un sistema de reputación que es actualizado periódicamente en base a datos vinculados con su actividad en el sitio y a los comentarios ingresados por los propios usuarios según las operaciones que hayan realizado. Los usuarios compradores se encuentran obligados a ingresar una calificación informando acerca de la concreción o no de la operación; pudiendo también, ingresar un comentario sobre como resultó la experiencia de compra en particular.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'En virtud que las calificaciones y comentarios que son realizados por los usuarios compradores, éstos serán incluidos bajo exclusiva responsabilidad de los usuarios compradores que los emitan. PROVEE no tiene obligación de verificar la veracidad o exactitud de los mismos y NO se responsabiliza por los dichos allí vertidos por cualquier usuario comprador, por las ofertas de compras que los usuarios vendedores realicen teniéndolos en cuenta o por la confianza depositada en las calificaciones de la contraparte o por cualquier otro comentario expresado dentro del sitio o a través de cualquier otro medio, incluido el correo electrónico. PROVEE se reserva el derecho de editar y/o eliminar aquellos comentarios que sean considerados inadecuados u ofensivos. PROVEE mantiene el derecho de excluir a aquellos usuarios vendedores que sean objeto de calificaciones y/o comentarios negativos.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Debido a que la verificación de la identidad de los usuarios vendedores en Internet es difícil, PROVEE no puede confirmar la identidad pretendida de cada usuario vendedor. Por ello los usuarios vendedores cuentan con un sistema de reputación de usuarios compradores que es actualizado periódicamente en base a datos vinculados con su actividad en el sitio y a los comentarios ingresados por los propios usuarios compradores según las operaciones que hayan realizado. ',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '16 - PROPIEDAD INTELECTUAL - LICENCIAS - ENLACES',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'PROVEE se reserva todos los derechos, incluyendo los derechos de propiedad intelectual e industrial, asociados con los servicios de PROVEE, la titularidad y derechos de autor sobre La Web y la documentación contenida en la misma, incluido todo nombre comercial, logotipos, textos, imágenes, audios, los contenidos de sus pantallas, programas, bases de datos, redes, códigos, desarrollo, software, arquitectura, hardware, contenidos, información, tecnología, fases de integración, funcionalidades, dominios, archivos que permiten al usuario acceder y crear su Cuenta etc., son de titularidad de PROVEE y se encuentran protegidos por las leyes de derechos de autor, sin que pueda entenderse que el uso o acceso a La Web y/o a los servicios que se ofrecen atribuya al afiliado, derecho alguno sobre esta información.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'En ningún caso se entenderá que el usuario tendrá algún tipo de derecho sobre los mismos excepto para utilizar el servicio de PROVEE conforme a lo previsto en estos Términos y Condiciones Generales. El uso indebido o contrario a la normativa vigente de los derechos de propiedad intelectual e industrial de PROVEE, así como su reproducción total o parcial, queda prohibido, salvo autorización expresa y por escrito de PROVEE. Por lo tanto, el usuario queda prohibido de hacer copias de parte o toda La Web o de la información contenida en la misma, incluyendo traducciones, compilaciones, modificaciones, ingeniería reversa, actualizaciones, exhibiciones, impresiones, distribuciones, así como cualquier otro acto que implique la manipulación, copia o modificación de La Web o de la información contenida en ésta, salvo que cuente con la autorización expresa y por escrito de PROVEE.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'El sitio puede contener enlaces a sitios web de terceros. En virtud que PROVEE no tiene control sobre tales sitios, no será responsable por los contenidos, materiales, acciones y/o servicios prestados por los mismos, ni por daños o pérdidas ocasionadas por la utilización de éstos, causados directa o indirectamente. La presencia de enlaces a otros sitios web no implica una sociedad, relación, aprobación, respaldo de PROVEE con dichos sitios y sus contenidos.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '17 - INDEMNIDAD',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'El usuario mantendrá intacto a PROVEE, así como a sus funcionarios, directivos, sucesores, administradores, representantes y/o empleados, por cualquier reclamo iniciado por otros usuarios, terceros o por cualquier Organismo, relacionado con sus actividades en el Sitio, el cumplimiento y/o el incumplimiento de los Términos y Condiciones Generales o demás Políticas, así como respecto de cualquier violación de leyes o derechos de terceros.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '18 - JURISDICCIÓN Y LEY APLICABLE',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Este acuerdo estará regido en todos sus puntos por las leyes vigentes en la República del Perú.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Cualquier controversia derivada del presente acuerdo, su existencia, validez, interpretación, alcance o cumplimiento, será sometida a los tribunales competentes de la ciudad de Lima, Perú.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '19 - DOMICILIO',
        style: HelperTheme.termTitle,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Se fija como domicilio de PROVEE Av. Cristóbal de Peralta sur 1427, Valle Hermoso - Surco, Lima, Perú.',
        style: HelperTheme.termBody,
        textAlign: TextAlign.justify,
      ),
    ),
  ];

  final userRepository = UserRepository();
  @override
  void onClose() {
    numberController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    emailController.dispose();
    codeController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.onClose();
  }

  void updateTypeDocument(String data) {
    typeDocument.value = data;
  }

  void updateShowPasswordConfirm(bool data) {
    showPasswordConfirm(data);
    update();
  }

  void updateShowPassword(bool data) {
    showPassword(data);
    update();
  }

  void changeIsChecked(bool data) {
    isChecked(data);
  }

  String? validatorNumber(String value) {
    if (value.isEmpty) {
      return 'Campo documento de identidad es obligatorio.';
    }
    return null;
  }

  String? validatorFirstName(String value) {
    if (value.isEmpty && typeDocument.value != 'RUC') {
      return 'Campo nombre es obligatorio.';
    }
    if (value.isEmpty && typeDocument.value == 'RUC') {
      return 'Campo razon social es obligatorio.';
    }
    return null;
  }

  String? validatorLastName(String value) {
    if (value.isEmpty && typeDocument.value != 'RUC') {
      return 'Campo apellido es obligatorio.';
    }
    return null;
  }

  String? validatorAddress(String value) {
    if (value.isEmpty) {
      return 'Campo direción es obligatorio.';
    }
    return null;
  }

  String? validatorPhone(String value) {
    if (value.isEmpty) {
      return 'Campo teléfono es obligatorio.';
    }
    return null;
  }

  String? validatorEmail(String value) {
    if (value.isEmpty) {
      return 'Campo correo electronico es obligatorio.';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Campo correo electrónico no es válido.';
    }
    return null;
  }

  String? validatorCode(String value) {
    if (value.isEmpty) {
      return 'Campo código de verificación es obligatorio.';
    }
    return null;
  }

  String? validatorPassword(String value) {
    if (value.isEmpty) {
      return 'Campo password es obligatorio.';
    }
    return null;
  }

  String? validatorPasswordConfirm(String value) {
    if (value.isEmpty) {
      return 'Campo confirmar contraseña es obligatorio.';
    }
    if (value != passwordController.text) {
      return 'Campo confirmar contraseña no coincide con la contraseña ingresada.';
    }
    return null;
  }

  void cancel() {
    Get.back();
  }

  void personal(personalFormKey) {
    bool validation = personalFormKey.currentState!.validate();
    numberFocusNode.unfocus();
    firstnameFocusNode.unfocus();
    lastnameFocusNode.unfocus();
    if (validation) {
      Get.to(
        () => const RegisterUserPageContact(),
        transition: Transition.rightToLeftWithFade,
        duration: const Duration(seconds: 1),
      );
    }
  }

  void contact(contactFormKey) async {
    bool validation = contactFormKey.currentState!.validate();
    late String title;
    late String message;
    addressFocusNode.unfocus();
    phoneFocusNode.unfocus();
    emailFocusNode.unfocus();
    if (validation) {
      globalController.isLoading(true);
      try {
        String data =
            await userRepository.sendVerificationCode(emailController.text);
        SnackbarUtil().snackbarSuccess('Confirmación', data);
        Get.to(
          () => const RegisterUserPageEmail(),
          transition: Transition.rightToLeftWithFade,
          duration: const Duration(seconds: 1),
        );
      } catch (e) {
        title = "Error";
        message = e.toString();
        SnackbarUtil().snackbarError(title, message);
      }
      globalController.isLoading(false);
    }
  }

  void email(emailFormKey) async {
    bool validation = emailFormKey.currentState!.validate();
    late String title;
    late String message;
    codeFocusNode.unfocus();
    passwordFocusNode.unfocus();
    passwordConfirmFocusNode.unfocus();
    if (validation) {
      globalController.isLoading(true);
      try {
        int data = await userRepository.validateVerificationCode(
            emailController.text, int.parse(codeController.text));
        if (data == 0) {
          SnackbarUtil().snackbarError(
              'Error', 'Código de verificación ingresado incorrecto.');
        } else {
          SnackbarUtil().snackbarSuccess(
              'Confirmación', 'Código de verificación ingresado es correcto.');
          Get.to(
            () => const RegisterUserPageTerm(),
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(seconds: 1),
          );
        }
      } catch (e) {
        title = "Error";
        message = e.toString();
        SnackbarUtil().snackbarError(title, message);
      }
      globalController.isLoading(false);
    }
  }

  void term() async {
    if (isChecked.value == false) {
      SnackbarUtil().snackbarError('Error',
          'Debe de aceptar los términos y condiciones para finalizar con su registro.');
    } else {
      late String title;
      late String message;
      globalController.isLoading(true);
      try {
        var type = typeDocument.value;
        var numberDocument = numberController.text;
        var name = firstnameController.text;
        var lastname = lastnameController.text;
        var address = addressController.text;
        var phone = phoneController.text;
        var email = emailController.text;
        var password = passwordController.text;

        String data = await userRepository.create(
          type,
          numberDocument,
          name,
          lastname,
          address,
          phone,
          email,
          password,
        );

        Get.to(
          () => const RegisterUserPageMessage(),
          transition: Transition.fadeIn,
          duration: const Duration(seconds: 1),
        );
        SnackbarUtil().snackbarSuccess('Confirmación', data);
      } catch (e) {
        title = "Error";
        message = e.toString();
        SnackbarUtil().snackbarError(title, message);
      }
      globalController.isLoading(false);
    }
  }

  void login() {
    Get.toNamed(
      Routes.LOGIN,
    );
  }
}
