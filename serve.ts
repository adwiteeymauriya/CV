import { spawn } from "bun";

// Start typst watch
const typst = spawn(["typst", "watch", "main.typ"], {
  cwd: import.meta.dir,
  stdout: "inherit",
  stderr: "inherit",
});

const server = Bun.serve({
  port: process.env.PORT || 41592,
  fetch() {
    return new Response(Bun.file(import.meta.dir + "/main.pdf"));
  },
});

console.log(`Serving CV at http://0.0.0.0:${server.port}`);
console.log(`Typst watching main.typ...`);

process.on("SIGINT", () => {
  typst.kill();
  process.exit();
});
