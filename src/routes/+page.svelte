<script lang="ts">
	import { goto } from "$app/navigation";

    async function PlayGame() {
        goto('/game');
    }
</script>
<div class="w-screen h-screen flex flex-col justify-center items-center bg-[#faf0e2]">
    <div class="w-full h-1/4 ">
        <h1 class="font-[Honeybee] text-7xl font-bold 2xl:text-9xl text-center text-[#bb6f8c]">Let play a game</h1>
    </div>
    <div class="w-full h-1/4 flex flex-row justify-center items-center gap-10">
        <button class="font-[Honeybee] w-1/5 h-2/5 rounded-3xl text-7xl 2xl:text-9xl font-bold text-[#bb6f8c]" onclick={PlayGame}>Go</button>
    </div>
    <div class="w-full h-1/4 flex justify-center items-center">
        <img class="h-full " src="https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExdGlmYzRnZXJ1ZmI1bTZ6YmZ4Z2p1bGNzcXZ5MHpqbDd1d2VlYW9zeCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/5dUllWbKVlaqmMTvHb/giphy.gif" alt="gif" />
    </div>
</div>
