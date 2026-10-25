# My Pack

Short description of what this pack adds to a MythWeave campaign.

## Using this template

1. Create a new repository from this template.
2. In `pack.json`, set `id` (lowercase letters, digits, dashes), `title`,
   `author`, `license` (an open license, as an SPDX id), `system`, and
   `dependencies`.
3. Add your content (see "Status" below).
4. Replace this README.
5. Keep `changelog.txt` in the strict format. The first release lands on `0.0.1`
   and keeps the manual entry that is already there.

### Dependencies cheat sheet

Dependencies use the syntax Factorio uses, adapted for packs and plugins:

| Syntax | Meaning |
| --- | --- |
| `"some-pack >= 1.0"` | Required. Loads after it |
| `"? some-pack"` | Optional. Loads after it if present |
| `"(?) some-pack"` | Optional, no load-order effect, hidden in the UI |
| `"~ some-pack"` | Required, no load-order effect |
| `"! some-pack"` | Incompatible |
| `"plugin:some-plugin >= 1.0"` | Requires a rules plugin |

## Packaging

```
scripts/package.sh
```

Builds `<id>_<version>.zip` from the repository (leaving out `.git`, `.github`,
`scripts`, and `.gitignore`) and prints its sha256 and size. The registry needs
both. The hash describes the exact file you release, so always register the hash
of the file you actually publish.

## Release

Not set up yet. It arrives together with the shared MythWeave tooling: a manual
release workflow that builds the changelog from pull request descriptions, and a
manual **Publish to registry** workflow. See `docs/release.md` and
`docs/registry.md` in the main
[mythweave](https://github.com/MythWeave-ttrpg/mythweave) repository.

## Status

This is a skeleton. The pack content schema (entities, `define`, `patch`, and
`finalize` stages, namespaced IDs, provenance and override examples) lands with
the rules packs work in Phase 3 of the MythWeave design. Examples and validation
will be added here once that schema exists.
