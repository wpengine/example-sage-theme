<p align="center">
  <img src="https://wpengine.com/wp-content/uploads/2020/08/WPE-LOGO-H-Default@3x.png" height="40px">
</p>

# Steps to recreate your own theme on your own github repo

1. [Create a wp engine site](https://my.wpengine.com/bulk_sites) if you don't already have one at wpengine.com. We'll use `"your-wp-install-name"` as an example.

2. Back on your machine, create your install directory that'll house the wordpress theme
```bash
mkdir your-wp-install-name && cd your-wp-install-name
```

3. Create the folder structure for the theme to ultimately be copied over
```bash
mkdir -p wp-content/themes && cd wp-content/themes
```

4. Within the themes directory, create your new theme using composer
```bash
composer create-project roots/sage your-roots-theme-name-here
```

5. With your new theme, you need acorn, the best way to install is also composer
```bash
cd your-roots-theme-name-here && composer require roots/acorn
```

6. [Add "post-autoload-dump" script](https://github.com/jreasoner-wpe/wpe-example-roots-theme/commit/9b2120c2601e84295aefe8d8915c93775407727b) that'll run after every composer update command to the `composer.json`

7. Create the directory structure for the github action
```bash
mkdir -p .github/workflows/ && cd .github/workflows/
```

8. Add the github action that'll deploy the theme
```bash
wget https://github.com/jreasoner-wpe/wpe-example-roots-theme/blob/main/.github/workflows/action.yml
```

9. Update just these sections of the `action.yml` file
```yml
name: Deploy to WP Engine
env:
  WPE_SSHG_KEY_PRIVATE: ${{ secrets.WPE_SSHG_KEY_PRIVATE }} # We'll add this later
  WPE_INSTALL_NAME: your-wp-install-name
  THEME_NAME: your-roots-theme-name-here
```

10. [Create and add an ssh-gateway private key](https://wpengine.com/support/ssh-gateway/#Create_SSH_Key) to [your repo's github secrets](https://wpengine.com/support/github-action-deploy/#Setup_Instructions) and the [my.wpengine.com](https://my.wpengine.com) portal.

11. Add a [`post-deploy.sh`](../post-deploy.sh) script to run [wp-cli](https://wpengine.com/resources/on-demand-webinar-developers-bada-wp-cli/) commands like, `wp acorn view:cache` to compile the Sage templates once deployed.
```bash
cd ../../ && wget https://github.com/jreasoner-wpe/wpe-example-roots-theme/blob/main/post-deploy.sh
```

12. And your done! With the action setup, it will now auto deploy and run the `post-deploy.sh` script. Just git commit and git push to your repo!

<div align="center">
  <br/><br/><br/><br/><br/>
  <img src="https://wpengine.com/wp-content/uploads/2020/08/WPE-LOGO-H-Default@3x.png"> 
  <br/><br/><br/><br/><br/>
  <h2>Still need help or have questions? Contact support!</h2>
  <a href="https://my.wpengine.com">Log in to your account</a> to get expert one-on-one help, 24 hours a day, 7 days a week, 365 days a year.
</div>
