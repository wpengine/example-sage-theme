# WP Engine Example Roots Theme

<p align="center">
<img src="https://wpengine.com/wp-content/uploads/2020/08/WPE-LOGO-H-Default@3x.png" height="80px" style="padding-right: 40px;">
<img src="https://camo.githubusercontent.com/5f0b97ec47b3b185d642826e44b3750209c464c90e610372f55e5356e639c6c0/68747470733a2f2f63646e2e726f6f74732e696f2f6170702f75706c6f6164732f6c6f676f2d736167652e737667">
</p>

An example of how write beautiful and modern templates, with modern CI/CD practices using github actions and the Roots/Sage theme using [wpengine.com](https://wpengine.com)

To produce beautiful themes like
```blade
<a class="sr-only focus:not-sr-only" href="#main">
  {{ __('Skip to content') }}
</a>

<div class="flex flex-col h-screen">
  <div>
    @include('sections.header')
  </div>

  <main id="main" class="w-full max-w-6xl px-4 mx-auto mt-6 mb-auto">
    @yield('content')
  </main>

  @include('sections.footer')
</div>
```

## To get started
You can either clone and modify this repo, [update the github action](https://github.com/wpengine/example-sage-theme/blob/main/.github/workflows/action.yml#L1-L5), and add a [WPE SSH Key](https://wpengine.com/support/github-action-deploy/#Setup_Instructions).
```yml
name: Deploy to WP Engine
env:
  WPE_SSHG_KEY_PRIVATE: ${{ secrets.WPE_SSHG_KEY_PRIVATE }}
  WPE_INSTALL_NAME: your-wp-install-name
  THEME_NAME: your-roots-theme-name-here
```

Or [copy these steps to recreate a fresh install on your own](docs/fresh.md).

## Frequently Asked Questions
- I thought WP Engine doesn't support Sage/Roots theme?
  - Sage was never fully supported due to the way Sage out of the box conflicted with our security best practices. In late 2022, we started to make changes to fully support pre-compiling Sage templates to enable official support if they follow the way this repo deploys with [`post-deploy.sh`](https://github.com/wpengine/example-sage-theme/blob/main/post-deploy.sh) script, that ultimately runs `wp acorn view:cache`.
- Sage wasn't supported until late 2022?
  - There have been ways of running Sage on WP Engine prior using customization or other means, but this approach is our offically supported way.
- What about Timber/Twig themes?
  - Those themes are also supported! Just [disable filesystem caching](https://timber.github.io/docs/guides/hosts-servers/#wordpress-vip) and let our other, more advanced, caching mechanisms take the place of that.
- Why not just disable filesystem caching on Sage the same way?
  - That's probably another great alternative, but it requires more effort/customization then many of our customers want, if that is a route you want to go, please be sure to let our support team know when you've made progress there and we'd love to add docs on how to accomplish that as well!
- I have more questions or need more help!
  - [Log in to your account](https://my.wpengine.com) to get expert one-on-one help, 24 hours a day, 7 days a week, 365 days a year.

## Alternatives

Also check out [local, our effortless way to develop WordPress sites locally](https://localwp.com/). Just be sure to run
```bash
wp acorn view:cache
```
after pushing changes to wpengine.com.
