import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Trueque',
          style: TextStyle(fontSize: 35, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            )),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 10),
          Text(
            'Lea estos términos y condiciones detenidamente antes de utilizar Nuestro Servicio.',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          const SizedBox(height: 15),
          Text(
            'INTERPRETACIONES Y DEFINICIONES',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            'Interpretaciones:',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            'Las palabras cuya letra inicial está en mayúscula tienen significados definidos en las siguientes condiciones. Las siguientes definiciones tendrán el mismo significado independientemente de que aparezcan en singular o en plural.',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            'Definiciones: ',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            'Afiliado:',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
          Text(
            'Afiliado significa una entidad que controla, está controlada por o está bajo control común con una parte, donde "control" significa la propiedad del 50% o más de las acciones, participación en el capital social u otros valores con derecho a voto para la elección de directores u otra autoridad de gestión. .',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            'Pais:',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
          Text(
            'Colombia',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            'Compañia:',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
          Text(
            'TRUEQUE',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            'Dispositivo:',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
          Text(
            'significa cualquier dispositivo que pueda acceder al Servicio, como una computadora, un teléfono celular o una tableta digital.',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            'Servicio de redes sociales de terceros :',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
          Text(
            'significa cualquier servicio o contenido (incluidos datos, información, productos o servicios) proporcionado por un tercero que puede ser mostrado, incluido o puesto a disposición por el Servicio.',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            'Pagina web:',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
          Text(
            'referido a TRUEQUE, accesible desde  http://www.trueque.com/',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            'Usted:',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
          Text(
            'se refiere a la persona que accede o utiliza el Servicio, o la empresa u otra entidad legal en nombre de la cual dicha persona accede o utiliza el Servicio, según corresponda.',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          const SizedBox(height: 15),
          Text(
            'RECONOCIMIENTO',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            'Estos son los Términos y Condiciones que rigen el uso de este Servicio y el acuerdo que opera entre Usted y la Compañía. Estos Términos y Condiciones establecen los derechos y obligaciones de todos los usuarios con respecto al uso del Servicio.',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            'Su acceso y uso del Servicio está condicionado a su aceptación y cumplimiento de estos Términos y Condiciones. Estos Términos y Condiciones se aplican a todos los visitantes, usuarios y otras personas que acceden o utilizan el Servicio.',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            'Al acceder o utilizar el Servicio, usted acepta estar sujeto a estos Términos y Condiciones. Si no está de acuerdo con alguna parte de estos Términos y condiciones, no podrá acceder al Servicio.',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            'Usted declara que es mayor de 18 años. La Compañía no permite que menores de 18 años utilicen el Servicio.',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            'Su acceso y uso del Servicio también está condicionado a su aceptación y cumplimiento de la Política de Privacidad de la Compañía. Nuestra Política de privacidad describe Nuestras políticas y procedimientos sobre la recopilación, uso y divulgación de Su información personal cuando utiliza la Aplicación o el Sitio web y le informa sobre Sus derechos de privacidad y cómo la ley lo protege. Lea nuestra Política de privacidad detenidamente antes de utilizar nuestro servicio.',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          const SizedBox(height: 15),
          Text(
            'TERMINACIÓN',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            'Podemos rescindir o suspender Su acceso de inmediato, sin previo aviso ni responsabilidad, por cualquier motivo, incluido, entre otros, si incumple estos Términos y condiciones.',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            'Tras la rescisión, su derecho a utilizar el Servicio cesará inmediatamente.',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          const SizedBox(height: 15),
          Text(
            'CAMBIOS A ESTOS TERMINOS Y CONDICIONES',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            'Nos reservamos el derecho, a Nuestro exclusivo criterio, de modificar o reemplazar estos Términos en cualquier momento. Si una revisión es importante, haremos los esfuerzos razonables para proporcionar un aviso de al menos 30 días antes de que entren en vigencia los nuevos términos. Lo que constituye un cambio material se determinará a Nuestro exclusivo criterio.',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            'Al continuar accediendo o utilizando Nuestro Servicio después de que esas revisiones entren en vigencia, usted acepta estar sujeto a los términos revisados. Si no está de acuerdo con los nuevos términos, en su totalidad o en parte, deje de usar el sitio web y el Servicio.',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          const SizedBox(height: 15),
          Text(
            'CONTACTENOS',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            'email:',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
          Text(
            'TRUEQUE@gmail.com',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            'Website:',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
          Text(
            'http://www.trueque.com/contact',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            'Celular:',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
          Text(
            '3016264162',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            'mail:',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
          Text(
            'Calle 144 #18-60 EDF antares APTO 507',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
