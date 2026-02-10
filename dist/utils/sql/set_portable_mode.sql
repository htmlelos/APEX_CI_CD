-- set_portable_mode.sql
-- Script para forzar la generación de artefactos APEX portables
SET SERVEROUTPUT ON
SET FEEDBACK OFF

DECLARE
    v_workspace_id NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Configurando exportación portable (Workspace ID -> NULL) ===');
    
    -- Limpiar configuraciones previas
    APEX_APPLICATION_INSTALL.CLEAR_ALL;
    
    -- Configurar ID de workspace a NULL para forzar portabilidad
    APEX_APPLICATION_INSTALL.SET_WORKSPACE_ID(NULL);
    APEX_APPLICATION_INSTALL.GENERATE_APPLICATION_ID;
    
    COMMIT;
    
    SELECT workspace_id INTO v_workspace_id FROM apex_applications WHERE application_id = 102;
    DBMS_OUTPUT.PUT_LINE('Configuración completada exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR en set_portable_mode.sql: ' || SQLERRM);
        RAISE;
END;
/
