defmodule InfotechCalendarWeb.UserDashboardLive do
    use InfotechCalendarWeb, :live_view

    def render(assigns) do
        ~H"""
        <div class="flex gap-2">
          <div class="rounded-md w-full flex flex-col gap-2">
            <div class="flex w-full gap-2">
              <div class="w-[48px] h-[48px] opacity-80 hover:opacity-100 bg-[#292B44] rounded-sm flex
                items-center justify-center text-white text-lg duration-100 cursor-pointer">+</div>

              <div class="w-full bg-[#292B44] rounded-sm flex items-center px-6">
                <input class="bg-transparent outline-none w-full text-sm text-white" placeholder="Search ..." />
              </div>

              <div class="h-[48px] px-3 bg-[#292B44] rounded-sm flex opacity-80 hover:opacity-100
                items-center justify-center text-white text-sm duration-100 cursor-pointer">
                Edit
              </div>
            </div>

            <div class="w-full max-h-[400px] overflow-y-auto flex flex-col gap-2 text-white hover:pr-2 duration-100">
              <div
                style="background: rgba(66, 82, 255, 0.4);"
                class="
                text-sm flex flex-col w-full border-l-4 px-3 py-1 cursor-pointer
                border-[#4252FF] rounded-sm hover:border-l-8 duration-100
                ">
                <p class="font-semibold">Štátne sviatky</p>
                <p>29.9</p>
              </div>

              <div
                style="background: rgba(66, 82, 255, 0.4);"
                class="
                text-sm flex flex-col w-full border-l-4 px-3 py-1
                border-[#4252FF] rounded-sm hover:border-l-8 duration-100
                ">
                <p class="font-semibold">Štátne sviatky</p>
                <p>29.9</p>
              </div>

              <div
                style="background: rgba(66, 82, 255, 0.4);"
                class="
                text-sm flex flex-col w-full border-l-4 px-3 py-1
                border-[#4252FF] rounded-sm hover:border-l-8 duration-100
                ">
                <p class="font-semibold">Štátne sviatky</p>
                <p>29.9</p>
              </div>

              <div
                style="background: rgba(66, 82, 255, 0.4);"
                class="
                text-sm flex flex-col w-full border-l-4 px-3 py-1
                border-[#4252FF] rounded-sm hover:border-l-8 duration-100
                ">
                <p class="font-semibold">Štátne sviatky</p>
                <p>29.9</p>
              </div>

              <div
                style="background: rgba(66, 82, 255, 0.4);"
                class="
                text-sm flex flex-col w-full border-l-4 px-3 py-1
                border-[#4252FF] rounded-sm hover:border-l-8 duration-100
                ">
                <p class="font-semibold">Štátne sviatky</p>
                <p>29.9</p>
              </div>

              <div
                style="background: rgba(66, 82, 255, 0.4);"
                class="
                text-sm flex flex-col w-full border-l-4 px-3 py-1
                border-[#4252FF] rounded-sm hover:border-l-8 duration-100
                ">
                <p class="font-semibold">Štátne sviatky</p>
                <p>29.9</p>
              </div>

              <div
                style="background: rgba(66, 82, 255, 0.4);"
                class="
                text-sm flex flex-col w-full border-l-4 px-3 py-1
                border-[#4252FF] rounded-sm hover:border-l-8 duration-100
                ">
                <p class="font-semibold">Štátne sviatky</p>
                <p>29.9</p>
              </div>

              <div
                style="background: rgba(66, 82, 255, 0.4);"
                class="
                text-sm flex flex-col w-full border-l-4 px-3 py-1
                border-[#4252FF] rounded-sm hover:border-l-8 duration-100
                ">
                <p class="font-semibold">Štátne sviatky</p>
                <p>29.9</p>
              </div>

              <div
                style="background: rgba(66, 82, 255, 0.4);"
                class="
                text-sm flex flex-col w-full border-l-4 px-3 py-1
                border-[#4252FF] rounded-sm hover:border-l-8 duration-100
                ">
                <p class="font-semibold">Štátne sviatky</p>
                <p>29.9</p>
              </div>
            </div>
          </div>

          <div class="flex flex-col gap-3 bg-[#292B44] min-w-[300px] p-3 text-white">
            <div class="flex items-center justify-between">
              <p class="text-sm font-semibold">[ACTION]</p>
              <p class="
                text-sm font-semibold flex items-center duration-100 cursor-pointer
                justify-center w-5 h-5 hover:bg-[#4252FF] rounded-full
              ">X</p>
            </div>
            <p>
              Type
              Action Type
              Name
              Date
              Is repetating
              Description
              Location
            </p>
          </div>
        </div>
        """
    end
end
