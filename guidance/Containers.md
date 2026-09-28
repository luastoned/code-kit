# Containers Agent

Use this guide for Dockerfiles, Compose, dev containers, Kubernetes, Helm, and other container build or deployment files. They define build and deployment behavior; inspect the relevant path: Dockerfile and build context for images, Compose for local services, devcontainer configuration for development, or Kubernetes and Helm for cluster deployment.

## Code Readability

Apply the shared [code-readability requirements](./AGENTS.md#code-readability) and [local-consistency rules](./AGENTS.md#changes-and-validation). The rules below do not replace them.

Apply these rules to authored container instructions and embedded code. Preserve layer behavior; do not split a `RUN` solely to add spacing.

## Core Rules

- Follow the existing container stack: Dockerfile, Docker Compose, BuildKit, dev containers, Kubernetes manifests, Helm charts, or CI image builds.
- Treat container files as deployment behavior, not just packaging.
- Keep build-time and runtime concerns separate.
- Do not include secrets, tokens, local paths, or machine-specific credentials in images.

## Context and Tooling

Inspect base images, platforms, runtime users, environment variables, secrets, volumes, ports, health checks, and deployment targets when affected. Discover whether commands build local images, start services, or mutate a remote cluster before running them. Record non-obvious local command side effects near the owning configuration.

## Dockerfiles

- Prefer multi-stage builds when they reduce runtime size or isolate build dependencies.
- Pin base image families deliberately; do not casually change distro, runtime, libc, or architecture assumptions.
- Keep dependency installation and source copy steps ordered for useful cache behavior.
- Use `.dockerignore` to keep build context small and avoid copying secrets or generated output.
- Prefer non-root runtime users when the application supports it.
- Use `COPY` instead of `ADD` unless archive extraction or remote URL behavior is intentionally needed.
- Combine package-manager updates, installation, and cleanup in one layer when appropriate for the base image.
- Avoid unbounded `latest` tags for production-oriented images unless the project already accepts that tradeoff.

## Compose and Runtime Config

- Keep service names, networks, volumes, ports, and env files consistent with existing workflows.
- Do not expose new host ports or mount sensitive paths unless required.
- Preserve health checks and startup ordering semantics.
- Keep local-development conveniences out of production manifests unless the project intentionally shares them.
- Be explicit about persistent volumes and data-loss implications.

## Secrets and Environment

- Pass secrets at runtime through the platform's secret mechanism or environment, not through image layers.
- Do not write secrets into Dockerfiles, Compose files, logs, build args, or committed env files.
- Keep required environment variables documented near the config that consumes them.

## Validation

Follow the shared [test-work rules](./AGENTS.md#test-work).

- Prefer the project's documented build or compose command.
- For Dockerfile changes, run a build when practical.
- For Compose changes, validate config rendering when practical, such as `docker compose config`.
- For Kubernetes or Helm changes, run schema or template validation when available. Applying manifests to a cluster requires authorization for that environment.
- If container tooling is unavailable locally, state what could not be verified.
