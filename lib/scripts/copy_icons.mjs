import { optimize } from "svgo";
import { resolve } from "path";
import fs from "fs/promises";
import { existsSync, mkdirSync } from "fs";
import prettier from "prettier";
import { fileURLToPath } from "url";
import { dirname } from "path";

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const sourcePath = resolve(__dirname, "../../node_modules/lucide-static/icons");
const destPath = resolve(__dirname, "../../assets/icons");
const configPath = resolve(__dirname, "../../config");

copyIcons(sourcePath, destPath, configPath);

async function copyIcons(sourcePath, destPath, configPath) {
  const files = await fs.readdir(sourcePath);
  const iconNames = [];

  if (!existsSync(destPath)) {
    mkdirSync(destPath);
  }

  await Promise.all(
    files
      .filter((fileName) => fileName.endsWith(".svg"))
      .map(async (fileName) => {
        const filePath = `${sourcePath}/${fileName}`;
        const svgText = await fs.readFile(filePath, {
          encoding: "utf8",
        });

        const optimizedSvg = optimize(svgText, {
          path: filePath,
          plugins: [
            {
              name: "removeAttrs",
              params: {
                attrs:
                  "(fill|stroke|stroke-width|stroke-linecap|stroke-linejoin)",
              },
            },
          ],
        });
        await fs.writeFile(`${destPath}/${fileName}`, optimizedSvg.data);

        iconNames.push(fileName.replace(".svg", ""));
      }),
  );

  const iconsDataFilePath = `${configPath}/icons.json`;

  prettier.resolveConfig(iconsDataFilePath).then(async (options) => {
    const formattedJSON = await prettier.format(
      JSON.stringify(iconNames.sort()),
      {
        ...options,
        parser: "json",
      },
    );
    await fs.writeFile(iconsDataFilePath, formattedJSON);
  });
}
