import * as dotenv from 'dotenv';
dotenv.config();

import { test, expect } from '@playwright/test';

test('Connexion valide avec identifiants corrects', async ({ page }) => {
  console.log('URL de login:', process.env.BEAURAIN_BASE_URL);

  await page.goto(process.env.BEAURAIN_BASE_URL!);

  await page.fill('//*[@id="email"]', process.env.BEAURAIN_ID!);
  await page.fill('//*[@id="password"]', process.env.BEAURAIN_MDP!);
  await page.click('//*[@id="vue"]/div/div/div/div/div[2]/form/div[4]/div/button');

  // Vérifie que l'utilisateur arrive bien sur la page d'accueil
  await expect(page).toHaveURL('https://beaurain-preprod.eden-erp.fr/eden/accueil');
  await expect(page.locator('//*[@id="base-content"]/div/div/div/div[1]/h4')).toContainText('Bienvenue');
});
