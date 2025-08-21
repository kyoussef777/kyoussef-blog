# Kamal Youssef - Portfolio Website

A modern, professional portfolio website built with Astro, showcasing my experience as a Platform Security Engineer and Software Engineering Lead.

🌐 **Live Site**: [kamalyoussef.dev](https://kamalyoussef.dev)  
📧 **Contact**: [LinkedIn](https://www.linkedin.com/in/kamalyoussef/) | [GitHub](https://github.com/kyoussef777)

## 🎯 About

This portfolio showcases my professional journey in platform security, DevSecOps, cloud automation, and software engineering leadership. Built with modern web technologies and optimized for performance and accessibility.

## ✨ Features

- 🏠 **Professional Homepage** with headshot and key highlights
- 👨‍💼 **About Page** with detailed work experience, education, and certifications
- 🚀 **Projects Showcase** featuring live GitHub repositories
- 📝 **Technical Blog** for sharing insights and experiences
- 📱 **Responsive Design** optimized for all devices
- ⚡ **High Performance** with 100/100 Lighthouse scores
- 🔍 **SEO Optimized** with proper meta tags and structured data
- 🎨 **Professional Styling** with modern UI/UX

## 🛠️ Built With

- **[Astro](https://astro.build/)** - Static site generator
- **TypeScript** - Type safety and better developer experience
- **CSS3** - Custom styling with modern features
- **Markdown/MDX** - Content management for blog posts

## 🗂️ Project Structure

```text
├── public/
│   ├── icons/          # Certification and education logos
│   └── favicon.svg
├── src/
│   ├── assets/         # Images and media files
│   │   └── headshot.jpeg
│   ├── components/     # Reusable Astro components
│   │   ├── BaseHead.astro
│   │   ├── Header.astro
│   │   └── Footer.astro
│   ├── content/        # Blog posts and content
│   │   └── blog/
│   ├── layouts/        # Page layouts
│   ├── pages/          # Route pages
│   │   ├── index.astro      # Homepage
│   │   ├── about.astro      # About page
│   │   ├── projects.astro   # Projects showcase
│   │   └── blog/            # Blog pages
│   ├── styles/         # Global styles
│   └── consts.ts       # Site configuration
├── astro.config.mjs
└── package.json
```

## 🚀 Getting Started

### Prerequisites

- Node.js 18+ 
- pnpm (recommended) or npm

### Installation

1. Clone the repository:
```bash
git clone https://github.com/kyoussef777/kamal-youssef-portfolio.git
cd kamal-youssef-portfolio
```

2. Install dependencies:
```bash
pnpm install
```

3. Start the development server:
```bash
pnpm dev
```

4. Open [http://localhost:4321](http://localhost:4321) in your browser

### Available Commands

| Command | Action |
|---------|--------|
| `pnpm install` | Install dependencies |
| `pnpm dev` | Start development server at `localhost:4321` |
| `pnpm build` | Build production site to `./dist/` |
| `pnpm preview` | Preview production build locally |
| `pnpm astro ...` | Run Astro CLI commands |

## 📝 Content Management

### Adding Blog Posts

1. Create a new `.md` or `.mdx` file in `src/content/blog/`
2. Add frontmatter with title, description, pubDate, and heroImage
3. Write your content in Markdown
4. The post will automatically appear on the blog page

Example frontmatter:
```yaml
---
title: 'Your Post Title'
description: 'Brief description of your post'
pubDate: 'Jan 15 2024'
heroImage: '../../assets/blog-image.jpg'
---
```

### Updating Projects

Projects are automatically pulled from GitHub repositories. To update:
1. Ensure your repositories are public
2. Add proper descriptions to your GitHub repos
3. Projects will display with live links to GitHub and deployed demos

### Updating Personal Information

- **Site title/description**: Edit `src/consts.ts`
- **About page content**: Edit `src/pages/about.astro`
- **Social links**: Update in `src/components/Header.astro`
- **Profile image**: Replace `src/assets/headshot.jpeg`

## 🎨 Customization

### Styling

The site uses custom CSS with CSS variables for easy theming. Main style file: `src/styles/global.css`

Key CSS variables:
- `--accent`: Primary accent color
- `--accent-dark`: Darker accent variant
- `--black`: Text color
- `--gray`: Secondary text color

### Adding New Pages

1. Create a new `.astro` file in `src/pages/`
2. Add navigation link in `src/components/Header.astro`
3. Follow existing page structure for consistency

## 🚦 Performance

This site is optimized for performance:
- ⚡ Static site generation with Astro
- 🖼️ Optimized images and assets
- 📦 Minimal JavaScript bundle
- 🎯 100/100 Lighthouse performance score

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 👨‍💼 About Kamal Youssef

Platform Security Engineer & Software Engineering Lead with expertise in:
- 🔒 DevSecOps and Infrastructure Security
- ☁️ AWS Cloud Architecture and Automation  
- 👥 Engineering Team Leadership
- 🤖 AI/ML Integration and Automation
- 🏗️ Enterprise-Scale Software Development

Currently pursuing M.S. Computer Science at Georgia Institute of Technology.

---

Built with ❤️ using [Astro](https://astro.build/) | Based on the [Bear Blog](https://github.com/HermanMartinus/bearblog/) theme