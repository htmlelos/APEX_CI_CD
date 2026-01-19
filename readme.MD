# 🛠️ Implementación de Integración Continua (CI) para Oracle APEX con Git y SQLcl

Este documento formaliza el proceso de **Integración Continua (CI)** para la aplicación **Oracle APEX (ID APP_ID)**. Se establece un flujo de trabajo que utiliza **Git** para el control de versiones y **SQLcl** como herramienta clave para la automatización de la exportación, importación y despliegue del código fuente.

**Versión de SQLcl Utilizada:** **25.3.2.0 Production**

**Entorno:**

* **Workspace:** `WORKSPACE`
* **Esquema:** `SCHEMA`
* **Application ID:** `APP_ID`
* **SQLcl Shortcuts (Aliases):** `dev` (desarrollo), `prod` (producción)
* **Repositorio:** `https://github.com/project-repository`

## 1. 🔗 Herramientas y Recursos y Configuración Inicial

### 1.1 Instalación de Herramientas

Para implementar este proceso, necesitas instalar y configurar las siguientes herramientas en tu entorno local.

* **Git Cliente:** Descarga el cliente de Git para tu sistema operativo.
    * **URL:** [https://git-scm.com/downloads](https://git-scm.com/downloads)
* **Oracle SQLcl:** Descarga y configura el cliente SQLcl (versión 25.3.2.0 o superior recomendada).
    * **URL:** [https://www.oracle.com/database/technologies/appdev/sqlcl.html](https://www.oracle.com/database/technologies/appdev/sqlcl.html)
---

> De aquí en adelante el símbolo `$` significa la consola de la shell del sistema operativo o cmd shell en windows. El símbolo `sql>` significa la consola de comandos de SQLcl.

## 2. ⚙️ Inicialización y Configuración del Proyecto

### 2.1 Creación de Estructura Local y Repositorio

| Tarea | Explicación | Comando Git |
| :--- | :--- | :--- |
| **2.1.1 Directorio** | Crea el directorio local que contendrá todo el proyecto. Luego, navega a este directorio para ejecutar los comandos. | `$ mkdir apex-ci-project` <br> `$ cd apex-ci-project` |
| **2.1.2 Inicializar Git** | Inicializa un nuevo repositorio de Git en el directorio local, permitiendo el seguimiento de cambios. | `$ git init` |
| **2.1.3 Crear readme** | Crea un archivo `README.md` para documentar el proyecto. Se añade de inmediato al *staging area* de Git. | `$ echo "# project-repository" >> README.md` <br> `git add README.md` |
| **2.1.4 Conectar a Remoto** | Vincula tu repositorio local con el repositorio remoto alojado en GitHub, dándole el alias estándar `origin`. | `$ git remote add origin https://github.com/project-repository` |
| **2.1.5 Crear Ramas** | Crea y cambia a la rama principal (`main`) y luego a la rama de desarrollo (`develop`). El trabajo se realiza primariamente en `develop`. | `$ git checkout -b main` <br> `$ git checkout -b develop` |
| **2.1.6 Estructura Base** | Crea el subdirectorio `apex/`, que será el destino exclusivo de los *scripts* de exportación de APEX, separándolos de otros archivos del proyecto (ej. *scripts* SQL de base de datos). | `$ mkdir apex` |
| **2.1.7 Configurar `.gitignore`** | Crea el archivo de exclusión para Git. Este archivo instruye a Git qué archivos ignorar (ej. archivos de *logs*, temporales o sensibles), manteniéndolos fuera del control de versiones. | `echo "*.log" >> .gitignore` <br> `echo "*.tmp" >> .gitignore` |

### 2.2 Configuración de SQLcl con `project init`

Para facilitar la exportación de APEX, **SQLcl 25.3.2.0** ofrece el comando `project init` para generar una estructura predefinida.

| Paso | Explicación | Comandos SQLcl |
| :--- | :--- | :--- |
| **2.2.0 `project init`** | Ejecuta `project init` para crear la estructura de APEX y los archivos `.dbtools/project.config.json` y `.dbtools/filters/project.filters`| `$ sql user/'password'@host:port/SERVICE` <br> `sql> project init -name project-name -schemas db-schema` <br> `sql> exit` |

### 2.3 Exportación Inicial de la Aplicación (Baseline)

Se exporta la aplicación APP_ID al directorio `apex/` para establecer la versión base en el repositorio.

| Paso | Explicación | Comandos SQLcl y Git |
| :--- | :--- | :--- |
| **2.3.1 Conexión** | Inicia SQLcl y conéctate al entorno de desarrollo utilizando el *alias* configurado. | `$ sql user/'password'@host:port/SERVICE` |
| **2.3.2 Exportación** | Exporta la aplicación al subdirectorio `apex/`. Esto genera el *script* `fAPP_ID.sql`. | `sql> apex export -applicationid APP_ID -dir apex` <br> `sql> exit` |
| **2.3.3 Confirmación** | Añade todos los archivos nuevos (exportación, `.gitignore`, `sqlcl.json`, etc.) al área de preparación y crea el primer *commit* estableciendo la versión base (`Baseline`). | `$ git add --all` <br> `$ git commit -m "feat: Baseline inicial de Aplicacion APP_ID"` |
| **2.3.4 Carga Remota** | Sube la estructura base y el *script* de exportación a GitHub en la rama `develop`. | `git push origin develop` |

---

## 3. 🔁 Ciclo de Desarrollo e Integración Continua

### 3.1 Desarrollo y Exportación de Cambios

El desarrollador trabaja en la rama `feature/tracking-number-feature-name` para aislar sus cambios y luego integra el código a la rama `develop` solo cuando está listo.

| Paso | Explicación | Comandos y Acciones |
| :--- | :--- | :--- |
| **3.1.1 Nueva Rama** | Crea y cambia a una rama de característica a partir de `develop`. | `$ git checkout -b feature/tracking-number-feature-name develop` |
| **3.1.2 Cambio en APEX** | Realiza el cambio necesario en el **Builder** de APEX. | *(Acción en el Builder de APEX)* |
| **3.1.3 Re-exportación** | Conéctate a la BD de desarrollo y ejecuta el comando de exportación. **SQLcl sobrescribe** el archivo `fAPP_ID.sql`. | `$ sql user/'password'@host:port/SERVICE` <br><br> `sql> apex export -applicationid APP_ID -dir apex` <br> `sql> exit` |
| **3.1.4 Confirmación** | Confirma los archivos modificados. El mensaje de *commit* debe ser descriptivo. | `$ git add --all` <br> `$ git commit -m "fix: [bug tracking number] Descripcion del cambio"` |
| **3.1.5 Carga (Push)** | Sube la rama de característica al repositorio remoto. | `$ git push origin feature/bug-tracking-number-feature-name` |

### 3.2 Integración y Pull de Cambios

Se simula la integración de los cambios (típicamente a través de un **Merge Request / Pull Request** en GitHub) y la sincronización del repositorio.

| Paso | Explicación | Comandos Git |
| :--- | :--- | :--- |
| **3.2.1 Integración** | Asume que el PR ha sido aprobado. Cambia a la rama `develop` e integra la rama de característica. | `git checkout develop` <br> `git merge feature/tracking-number-feature-name` |
| **3.2.2 Subir a Remoto** | Sincroniza la rama `develop` local con la remota. | `git push origin develop` |
| **3.2.3 Pull de Cambios** | Simulación de un colega que actualiza su copia local. | `git pull origin develop` |

---

## 4. 🏷️ Gestión de Releases y Control de Versiones

Se utiliza Git para marcar puntos estables de la aplicación que están listos para pasar a producción.

| Tarea | Explicación | Comandos Git |
| :--- | :--- | :--- |
| **4.1 Rama de *Release*** | Crea una rama de *release* estable a partir de `develop`. | `git checkout -b release/1.0.0` |
| **4.2 Etiquetar (*Tag*)** | Crea una **etiqueta (tag)** inmutable para marcar la versión canónica y estable (**v1.0.0**). | `git tag -a v1.0.0 -m "Versión 1.0.0: Primera versión de producción estable."` |
| **4.3 Integración a Main** | Mueve la rama `main` al punto de *release* estable. | `git checkout main` <br> `git merge release/1.0.0` |
| **4.4 Carga de Tags** | Sube el *tag* y la rama `main` al repositorio remoto. | `git push origin main` <br> `git push origin --tags` |

### 4.5 Gestión de *Releases* con SQLcl

Utiliza `project release` para generar *scripts* de instalación y desinstalación para el esquema de base de datos asociado al proyecto.

| Tarea | Explicación | Comandos SQLcl |
| :--- | :--- | :--- |
| **4.5.1 Crear *Release*** | Ejecuta `project release` para generar *scripts* de instalación y desinstalación para el esquema. | `$ sql user/'password'@host:port/SERVICE` <br> `sql> project release 1.0.0` <br> `sql> exit` |
| **4.5.2 Revisar Archivos** | Verifica que se hayan creado los archivos `install.sql` y `uninstall.sql` en el directorio de *scripts* del proyecto. | *(Revisar la estructura de archivos)* |
| **4.5.3 Commit de Scripts** | Confirma estos nuevos *scripts* de *release* en Git para que formen parte del *tag* `v1.0.0`. | `$ git add install.sql uninstall.sql` <br> `$ git commit -m "release: v1.0.0 scripts de instalación"` |

---

## 5. 🚢 Despliegue (Deploy) a Producción (CI/CD)

El despliegue a producción se realiza importando la aplicación desde la versión estable (`main` o el *tag* `v1.0.0`). Este es el paso de **Entrega Continua (CD)**.

### 5.1 Preparación del Despliegue

| Tarea | Explicación | Comandos Git |
| :--- | :--- | :--- |
| **5.1.1 Obtener Versión** | Asegúrate de que tu directorio de trabajo local esté apuntando al *tag* exacto de la versión que vas a desplegar. | `$ git checkout v1.0.0` |

### 5.2 Ejecución del Despliegue

| Paso | Explicación | Comando SQLcl |
| :--- | :--- | :--- |
| **5.2.1 Conexión PROD** | Conéctate a la base de datos de producción. | `$ sql user/'password'@host:port/SERVICE` |
| **5.2.2 Importación** | Ejecuta el *script* de exportación (`fAPP_ID.sql`) que está en la versión etiquetada. | `@apex/fAPP_ID.sql` |
| **5.2.3 Finalización** | Cierra la conexión. | `sql> exit` |

**Conclusión:** Este flujo utiliza **Git** para gestionar el **qué** se despliega (la versión etiquetada) y **SQLcl** para gestionar el **cómo** (la ejecución automatizada del *script* de exportación e importación).