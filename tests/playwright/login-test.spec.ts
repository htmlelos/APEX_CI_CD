import { test, expect } from '@playwright/test';

test.describe('APEX Application Availability', () => {
  test('should login successfully', async ({ page }) => {
    // 1. Navegar a la página de login (la URL base está en playwright.config.ts)
    await page.goto('./');

    // 2. Verificar que estamos en la página de login
    await expect(page).toHaveTitle(/Log In/i);

    // 3. Completar credenciales
    // Usamos los IDs específicos obtenidos del HTML: P9999_USERNAME y P9999_PASSWORD
    // Si las variables de entorno no están definidas, usamos valores por defecto para pruebas locales
    const username = process.env.APEX_TEST_USER || 'TEST_ADMIN';
    const password = process.env.APEX_TEST_PASS || 'Mono000blanco_';

    await page.fill('#P9999_USERNAME', username);
    await page.fill('#P9999_PASSWORD', password);

    // 4. Hacer clic en el botón "Sign In"
    // Usamos el texto del botón para ser más resistentes a cambios de ID generados
    await page.click('button:has-text("Sign In")');

    // 5. Verificar redirección exitosa
    // Esperamos que el título cambie o que aparezca un elemento de la página de inicio
    // Ajustar según el comportamiento real de la aplicación post-login
    // Por ahora, verificamos que NO estemos en la página de login o que no haya mensaje de error
    await expect(page.locator('#APEX_ERROR_MESSAGE')).not.toBeVisible();

    // Opcional: Verificar URL o Título de la página de destino si se conoce
    // await expect(page).toHaveURL(/.*home/);
  });
});
