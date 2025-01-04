const plugin = require("tailwindcss/plugin")
const fs = require("fs")
const path = require("path")

module.exports = {
    darkMode: 'class',
    content: [
        "./js/**/*.js",
        "../lib/infotech_calendar_web.ex",
        "../lib/infotech_calendar_web/**/*.*ex"
    ],
    theme: {
        extend: {
            borderRadius: {
                lg: 'var(--radius)',
                md: 'calc(var(--radius) - 2px)',
                sm: 'calc(var(--radius) - 4px)'
            },
            colors: {
                background: 'hsl(var(--background))',
                foreground: 'hsl(var(--foreground))',
                card: {
                    DEFAULT: 'hsl(var(--card))',
                    foreground: 'hsl(var(--card-foreground))'
                },
                popover: {
                    DEFAULT: 'hsl(var(--popover))',
                    foreground: 'hsl(var(--popover-foreground))'
                },
                primary: {
                    DEFAULT: 'hsl(var(--primary))',
                    foreground: 'hsl(var(--primary-foreground))'
                },
                secondary: {
                    DEFAULT: 'hsl(var(--secondary))',
                    foreground: 'hsl(var(--secondary-foreground))'
                },
                muted: {
                    DEFAULT: 'hsl(var(--muted))',
                    foreground: 'hsl(var(--muted-foreground))'
                },
                accent: {
                    DEFAULT: 'hsl(var(--accent))',
                    foreground: 'hsl(var(--accent-foreground))'
                },
                destructive: {
                    DEFAULT: 'hsl(var(--destructive))',
                    foreground: 'hsl(var(--destructive-foreground))'
                },
                border: 'hsl(var(--border))',
                border_active: 'hsl(var(--border-active))',
                input: 'hsl(var(--input))',
                ring: 'hsl(var(--ring))',
                chart: {
                    '1': 'hsl(var(--chart-1))',
                    '2': 'hsl(var(--chart-2))',
                    '3': 'hsl(var(--chart-3))',
                    '4': 'hsl(var(--chart-4))',
                    '5': 'hsl(var(--chart-5))'
                },
                sidebar: {
                    DEFAULT: 'hsl(var(--sidebar-background))',
                    foreground: 'hsl(var(--sidebar-foreground))',
                    primary: 'hsl(var(--sidebar-primary))',
                    'primary-foreground': 'hsl(var(--sidebar-primary-foreground))',
                    accent: 'hsl(var(--sidebar-accent))',
                    'accent-foreground': 'hsl(var(--sidebar-accent-foreground))',
                    border: 'hsl(var(--sidebar-border))',
                    ring: 'hsl(var(--sidebar-ring))'
                }
            },
            keyframes: {
                'accordion-down': {
                    from: {
                        height: '0'
                    },
                    to: {
                        height: 'var(--radix-accordion-content-height)'
                    }
                },
                'accordion-up': {
                    from: {
                        height: 'var(--radix-accordion-content-height)'
                    },
                    to: {
                        height: '0'
                    }
                }
            },
            animation: {
                'accordion-down': 'accordion-down 0.2s ease-out',
                'accordion-up': 'accordion-up 0.2s ease-out'
            }
        }
    },
    plugins: [
        require("@tailwindcss/forms"),
        // Allows prefixing tailwind classes with LiveView classes to add rules
        // only when LiveView classes are applied, for example:
        //
        //     <div class="phx-click-loading:animate-ping">
        //
        plugin(({addVariant}) => addVariant("phx-click-loading", [".phx-click-loading&", ".phx-click-loading &"])),
        plugin(({addVariant}) => addVariant("phx-submit-loading", [".phx-submit-loading&", ".phx-submit-loading &"])),
        plugin(({addVariant}) => addVariant("phx-change-loading", [".phx-change-loading&", ".phx-change-loading &"])),

        // Embeds Heroicons (https://heroicons.com) into your app.css bundle
        // See your `CoreComponents.icon/1` for more information.
        //
        plugin(function({matchComponents, theme}) {
            let iconsDir = path.join(__dirname, "../deps/heroicons/optimized")
            let values = {}
            let icons = [
                ["", "/24/outline"],
                ["-solid", "/24/solid"],
                ["-mini", "/20/solid"],
                ["-micro", "/16/solid"]
            ]
            icons.forEach(([suffix, dir]) => {
                fs.readdirSync(path.join(iconsDir, dir)).forEach(file => {
                    let name = path.basename(file, ".svg") + suffix
                    values[name] = {name, fullPath: path.join(iconsDir, dir, file)}
                })
            })
            matchComponents({
                "hero": ({name, fullPath}) => {
                    let content = fs.readFileSync(fullPath).toString().replace(/\r?\n|\r/g, "")
                    let size = theme("spacing.6")
                    if (name.endsWith("-mini")) {
                        size = theme("spacing.5")
                    } else if (name.endsWith("-micro")) {
                        size = theme("spacing.4")
                    }
                    return {
                        [`--hero-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
                        "-webkit-mask": `var(--hero-${name})`,
                        "mask": `var(--hero-${name})`,
                        "mask-repeat": "no-repeat",
                        "background-color": "currentColor",
                        "vertical-align": "middle",
                        "display": "inline-block",
                        "width": size,
                        "height": size
                    }
                }
            }, {values})
        })
    ]
}
