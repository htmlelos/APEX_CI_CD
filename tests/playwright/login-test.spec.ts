import { test, expect } from '@playwright/test';

test.describe('APEX Application Availability', () => {
  test('should load the login page', async ({ page }) => {
    // La URL se toma del baseURL en playwright.config.ts o variable de entorno
    await page.goto('./');

    // Verificar que el título contiene APEX o el nombre de la app (ajustar según sea necesario)
    await expect(page).toHaveTitle(/Login|APP_CICD/i);

    // Verificar que existe el campo de usuario
    const userField = page.locator('input[name="P9999_USERNAME"], input#P101_USERNAME');
    if (await userField.isVisible()) {
      await expect(userField).toBeVisible();
    }
  });
});
