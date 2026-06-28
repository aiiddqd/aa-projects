// @ts-check
import { defineConfig } from 'astro/config';

const repository = process.env.GITHUB_REPOSITORY?.split('/')[1];
const repositoryOwner = process.env.GITHUB_REPOSITORY_OWNER;
const isGitHubPagesBuild = process.env.GITHUB_PAGES === 'true' && repository && repositoryOwner;

const base = isGitHubPagesBuild ? `/${repository}/` : '/';
const site = isGitHubPagesBuild ? `https://${repositoryOwner}.github.io/${repository}/` : undefined;

// https://astro.build/config
export default defineConfig({
	base,
	site,
});
