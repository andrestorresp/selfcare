Consultation.destroy_all
Blog.destroy_all
Diagnosis.destroy_all
Doctor.destroy_all
Patient.destroy_all
User.destroy_all

#Método de crear usuario
def crear_usuario(email, password, role, first_name, last_name, address, latitude, longitude, dni, phone_number, age, photo_path)
  usuario = User.new(
    email: email,
    password: password,
    role: role,
    first_name: first_name,
    last_name: last_name,
    address: address,
    latitude: latitude,
    longitude: longitude,
    dni: dni,
    phone_number: phone_number,
    age: age
  )
  usuario.photo.attach(io: File.open(photo_path), filename: File.basename(photo_path), content_type: 'image/jpeg')

  if usuario.save
    puts "#{first_name} insertado correctamente"
  else
    puts "Error al insertar #{first_name}: #{usuario.errors.full_messages}"
  end
end

#Método de crear paciente
def creacion_paciente()
  last_user_id = User.order(id: :desc).first.id
  patient = Patient.new(
    user_id: last_user_id
  )
  if patient.save
    puts "Paciente creado correctamente"
  else
    puts "Error al crear el paciente"
  end
end

#Método de crear doctor
def creacion_doctor(specialty, sap)
  last_user_id = User.order(id: :desc).pluck(:id).first
  doctor = Doctor.new(
    specialty: specialty,
    sap: sap,
    user_id: last_user_id
  )

  if doctor.save
    puts "Doctor creado correctamente"
  else
    puts "Error al crear el doctor"
  end
end

def creacion_diagnosis(diabetes, hypertension, tuberculosis, cancer, other_diseases, other_details)
  # Obtener todos los IDs de los pacientes que ya tienen un diagnóstico
  pacientes_con_diagnostico = Diagnosis.pluck(:patient_id)

  # Obtener todos los IDs de los pacientes
  todos_los_pacientes = Patient.pluck(:id)

  # Excluir los IDs de los pacientes que ya tienen un diagnóstico
  pacientes_sin_diagnostico = todos_los_pacientes - pacientes_con_diagnostico

  # Seleccionar un paciente al azar de los que no tienen diagnóstico
  paciente_id = pacientes_sin_diagnostico.sample

  # Crear el diagnóstico
  diagnosis = Diagnosis.new(
    diabetes: diabetes,
    hypertension: hypertension,
    tuberculosis: tuberculosis,
    cancer: cancer,
    other_diseases: other_diseases,
    other_details: other_details,
    patient_id: paciente_id
  )

  if diagnosis.save
    puts "¡Diagnóstico creado exitosamente!"
  else
    puts "¡Error al crear el diagnóstico!"
  end
end

#Observar bien para alguna modificación
#Se crea un usuario y luego un paciente
crear_usuario("alvarorg2111@gmail.com", "12345678", false, "Alvaro", "Raga", "Centro Comercial, Casa bera Av. Urdaneta, Caracas 1020, Distrito Capital", 10.50625135218911, -66.90403438896753, 28154771, "0414-1234567", 22, 'app/assets/images/perfiles/Perfil_Alvaro.jpg')
creacion_paciente()
crear_usuario("alberto.manrique99@gmail.com", "12345678", false, "Gabriel", "Manrique", "Municipio Carrizal 1203, Miranda", 10.36859487233048, -66.99592860600289, 28921249, "0414-0156629", 25, 'app/assets/images/perfiles/Perfil_Gabriel.jpg')
creacion_paciente()
crear_usuario("erika.azuaje2014@gmail.com", "12345678", false, "Erika", "Azuaje", "Carr. Petare - Sta. Lucía, Caracas 1073, Distrito Capital", 10.468863973857529, -66.76779921808335, 23631976, "0414-1256627", 25, 'app/assets/images/perfiles/Perfil_Erika.jpg')
creacion_paciente()

#A continuación son la creación de los usaurios y luego la creación de los doctores
crear_usuario("leonardocabrices1@gmail.com", "12345678", true, "Leonardo", "Parra", "Centro Comercial, Casa bera Av. Urdaneta, Caracas 1020, Distrito Capital", 10.50625135218911, -66.90403438896753, 26466787, "0987654321", 25, 'app/assets/images/perfiles/Perfil_Leonardo.png')
creacion_doctor("Traumatología", "8190967")
crear_usuario("dragotorres16@gmail.com", "12345678", true, "Andres", "Torres", "Avenida Principal de Las Polonias Viejas, centro comercial montebello, Municipio Carrizal 1203, Miranda", 10.359272059129669, -66.97594958444186, 25562969, "1122334455", 27, 'app/assets/images/perfiles/Perfil_Andres.jpg')
creacion_doctor("Pediatría", "4720361")
crear_usuario("odreman@gmail.com", "12345678", true, "Crhistopher", "Odreman", "Av. Principal De Las Rosas, Guatire 1221, Miranda", 10.46388043559612, -66.51913724232891, 26809648, "2347654321", 25, 'app/assets/images/perfiles/Perfil_Crhistopher.jpg')
creacion_doctor("Cardiología", "6983572")
crear_usuario("jacg182010@gmail.com", "12345678", true, "Jose", "Carrillo", "C. Ribas, Los Teques 1201, Miranda", 10.345151275851153, -67.04269880010001, 24043798, "5981631461", 28, 'app/assets/images/perfiles/Perfil_Carrillo.jpg')
creacion_doctor("Ginecología", "8195743")
crear_usuario("aronlista@gmail.com", "12345678", true, "Aaron", "Lista", "San Antonio de Los Altos 1204, Miranda", 10.37491209115916, -66.9617740204026, 28017502, "0424-9876543", 22, 'app/assets/images/perfiles/Perfil_Aron.jpg')
creacion_doctor("Medicina General", "5467891")
crear_usuario("javiergalviz@gmail.com", "12345678", true, "Javier", "Galviz", "Av. 9 de Julio s/n, C1043 Buenos Aires, Argentina", -34.60357550119154, -58.38157040372827, 28324815, "+54 9 11 1234-5678", 23, 'app/assets/images/perfiles/Perfil_Javier.jpg')
creacion_doctor("Cirugía General", "3269214")
crear_usuario("genesisrodriguez@gmail.com", "12345678", true, "Genesis", "Rodriguez", "Cra. 7 #N. 28-66, Bogotá, Colombia", 4.615682752832807, -74.06859698328122, 27439547, "+57 1 234 5678", 25, 'app/assets/images/perfiles/Perfil_Genesis.jpg')
creacion_doctor("Traumatología", "7618459")
crear_usuario("yonathanpalma@gmail.com", "12345678", true, "Yonathan", "Palma", "C2P7+2RC, Av. Principal de Caricuao, Caracas 1000, Distrito Capital", 10.435217817799911, -66.98547061614683, 27607340, "8801631461", 30, 'app/assets/images/perfiles/Perfil_Yonathan.jpg')
creacion_doctor("Pediatría", "2359187")


#Creación de los blogs
blog1 = Blog.create!(
  comment: "
  La práctica médica presenta desafíos éticos diversos que los profesionales deben abordar, desde la confidencialidad del paciente hasta la toma de decisiones al final de la vida, garantizando la integridad y la calidad de la atención.",
  title: "Ética médica: Desafíos y soluciones",
  user_id: User.first.id
)

blog1.photo.attach(io: File.open('app/assets/images/blogs/Desafios_eticos.jpg'), filename: 'Desafios_eticos.jpg', content_type: 'image/jpeg')

puts "Blog 1 creado correctamente"

blog2 = Blog.create!(
  comment: "Un término que antes parecía pertenecer a un futuro distante, se ha convertido en una realidad tangible que está revolucionando la forma en que recibimos atención médica en la era digital.",
  title: "Telemedicina en la era digital",
  user_id: User.second.id
)

blog2.photo.attach(io: File.open('app/assets/images/blogs/Telemedicina.jpg'), filename: 'Telemedicina.jpg', content_type: 'image/jpeg')

puts "Blog 2 creado correctamente"

blog3 = Blog.create!(
  comment: "La pandemia de COVID-19 ha tenido un impacto significativo en la salud mental, provocando estrés, ansiedad, depresión y trauma en la sociedad. Este impacto refleja los desafíos generalizados que enfrentamos durante estos tiempos difíciles.",
  title: "Impacto psicológico de COVID-19",
  user_id: User.third.id
)

blog3.photo.attach(io: File.open('app/assets/images/blogs/COVID.jpg'), filename: 'COVID.jpg', content_type: 'image/jpeg')

puts "Blog 3 creado correctamente"

blog4 = Blog.create!(
  comment: "La salud mental es esencial en la atención médica integral. Aunque se enfoca más en la salud física, se reconoce su importancia para el bienestar general.",
  title: "Importancia de la salud mental",
  user_id: User.last.id
)

blog4.photo.attach(io: File.open('app/assets/images/blogs/Salud_Mental.jpg'), filename: 'Salud_Mental.jpg', content_type: 'image/jpeg')

puts "Blog 4 creado correctamente"

blog5 = Blog.create!(
  comment: "La vida saludable promueve una nutrición equilibrada, actividad física y técnicas de manejo del estrés para mejorar la calidad de vida y el bienestar general.",
  title: "Vida Saludable Blog",
  user_id: User.last.id
)

blog5.photo.attach(io: File.open('app/assets/images/blogs/Vida_Saludable.jpg'), filename: 'Vida_Saludable.jpg', content_type: 'image/jpeg')

puts "Blog 5 creado correctamente"

blog6 = Blog.create!(
  comment: "Un enfoque holístico de la salud, combinando medicina alternativa y convencional. Incluye acupuntura, medicina herbal, yoga y meditación para el bienestar físico, mental y emocional.",
  title: "Medicina Holística Blog",
  user_id: User.last.id
)

blog6.photo.attach(io: File.open('app/assets/images/blogs/Medicina_Holistica.jpg'), filename: 'Medicina_Holistica.jpg', content_type: 'image/jpeg')

puts "Blog 6 creado correctamente"

blog7 = Blog.create!(
  comment: "Un enfoque holístico de la salud integra prácticas alternativas y complementarias con la medicina convencional. Incluye acupuntura, medicina herbal, meditación, yoga y terapias holísticas para bienestar físico, mental y emocional.",
  title: "Bandas de Resistencia Blog",
  user_id: User.last.id
)

blog7.photo.attach(io: File.open('app/assets/images/blogs/Banda_Elastica.jpg'), filename: 'Banda_Elastica.jpg', content_type: 'image/jpeg')

puts "Blog 7 creado correctamente"

blog8 = Blog.create!(
  comment: "Explora pesas tobilleras y muñequeras. Mejora tu entrenamiento, añade resistencia, fortalece músculos, consejos sobre peso y ejercicios. Alcanza metas fitness eficientemente. ¡Potencia tu entrenamiento ahora!",
  title: "Guía de Tobilleras y Muñequeras",
  user_id: User.last.id
)

blog8.photo.attach(io: File.open('app/assets/images/blogs/Munequera_Tobilleras.jpg'), filename: 'Munequera_Tobilleras.jpg', content_type: 'image/jpeg')

puts "Blog 8 creado correctamente"

def creacion_consultations(diagnostic)
  patient_ids = Patient.pluck(:id)
  doctor_ids = Doctor.pluck(:id)

  consultation = Consultation.new(
    diagnostic: diagnostic,
    patient_id: patient_ids.sample,
    doctor_id: doctor_ids.sample
  )

  if consultation.save
    puts "¡Consulta creada exitosamente!"
  else
    puts "¡Error al crear la consulta!"
  end
end

creacion_consultations("La lesión en el tobillo derecho es un problema común que puede ocurrir debido a una variedad de razones, como torceduras, esguinces, fracturas o tensiones. Puede afectar a personas de todas las edades y niveles de actividad física.")
creacion_consultations("El dolor abdominal de origen desconocido es un síntoma que puede presentarse por una variedad de razones y puede afectar a personas de todas las edades y géneros. Este tipo de dolor puede manifestarse de diferentes formas, como calambres, punzadas o sensaciones de presión en el área abdominal.")
creacion_consultations("La hipertensión arterial controlada es una condición médica en la que la presión arterial se mantiene dentro de los límites normales mediante la implementación de cambios en el estilo de vida y, en algunos casos, el uso de medicamentos recetados.")
creacion_consultations("El esguince cervical moderado es una lesión en los tejidos blandos del cuello, causada comúnmente por una fuerza brusca o un movimiento repentino de la cabeza hacia atrás, adelante o de lado a lado.")
creacion_consultations("La bronquitis aguda es una inflamación de los bronquios, los conductos que llevan el aire hacia los pulmones. Esta afección suele ser causada por virus respiratorios, como el virus de la gripe o el virus sincitial respiratorio")
creacion_consultations("La gastroenteritis es una inflamación del revestimiento del estómago e intestinos que puede ser causada por virus, bacterias o parásitos. Los síntomas comunes incluyen náuseas, vómitos, diarrea y dolor abdominal.")
creacion_consultations("La neumonía es una infección pulmonar que puede ser causada por bacterias, virus u hongos. Los síntomas incluyen tos, fiebre, dificultad para respirar y dolor en el pecho.")
creacion_consultations("La diabetes tipo 2 es una enfermedad crónica que afecta la forma en que el cuerpo procesa la glucosa en sangre. Los síntomas incluyen sed excesiva, micción frecuente, fatiga y visión borrosa.")
creacion_consultations("La artritis reumatoide es una enfermedad autoinmune que causa inflamación en las articulaciones. Los síntomas incluyen dolor, hinchazón, rigidez y dificultad para mover las articulaciones.")
creacion_consultations("La ansiedad es una respuesta natural del cuerpo al estrés, pero cuando se vuelve excesiva o persistente, puede interferir con la vida diaria. Los síntomas incluyen nerviosismo, preocupación excesiva, irritabilidad y tensión muscular.")

# Crear un diagnóstico para un paciente con diabetes y tuberculosis
creacion_diagnosis(true, false, true, false, nil, nil)

# Crear un diagnóstico para un paciente con cáncer y otras enfermedades
creacion_diagnosis(false, false, false, true, "Padezco de Asma  desde los 5 años y de artritis desde una vez que fui senderista", "Cambios en el estado de salud desde el último chequeo médico")

# Crear un diagnóstico para un paciente con hipertensión y otros detalles especificados
creacion_diagnosis(false, true, false, false, "Sufro de Depresión, ansiedad, problemas cardíacos", "Síntomas específicos asociados con la condición médica. Presión arterial alta, medicamentos recetados")
