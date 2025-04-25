// vite.config.ts
import { defineConfig } from 'vite';

export default defineConfig({
  build: {
    outDir: 'dist',
    target: 'es2020',
    rollupOptions: {
      input: './src/index.ts', // entry point
      output: {
        format: 'es', // ESM format
        entryFileNames: 'index.js',
      },
    },
  },
});