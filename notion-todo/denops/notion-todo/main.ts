import { Client } from "https://deno.land/x/notion_sdk/src/mod.ts";
import { execute } from "https://deno.land/x/denops_std@v1.0.0/helper/mod.ts";
import { ensureString } from "https://deno.land/x/unknownutil@v1.0.0/mod.ts";

const notion = new Client({
  auth: Deno.env.get("NOTION_TOKEN"),
})

const databaseId = "3ad37125d0144932a9162d9111126b83";

async function retrieve(databaseId: string): string[] {
  try {
    let todoStatuses: string[] = [];
    const response = await notion.databases.retrieve({ database_id: databaseId });
    if ('properties' in response && 'select' in response.properties.Status) {
      for (const option of response.properties.Status.select.options) {
        if ('name' in option) {
          todoStatuses.push(option.name);
        }
      }
    }

    let ret: string[] = [];
    for (const todoStatus of todoStatuses) {
      ret.push(todoStatus);
      const response = await notion.databases.query({
        database_id: databaseId,
        filter: {
          property: 'Status',
          select: {
            equals: todoStatus,
          }
        },
      })
      for (const result of response.results) {
        if ('properties' in result && 'title' in result.properties.Name) {
          ret.push('- ' + result.properties.Name.title[0].plain_text);
        }
      }
      ret.push('');
    }
    return ret;
  } catch (error) {
    console.log("err");
    console.error(error.body);
  }
}

export async function main(denops: Denops): Promise<void> {
  denops.dispatcher = {
    async todo(opener: unknown): Promise<void> {
      let content = await retrieve(databaseId);
      await denops.cmd(opener || "new");
      await denops.call("setline", 1, content);
      await execute(denops, `
                    setlocal bufhidden=wipe buftype=nofile
                    setlocal nobackup noswapfile
                    setlocal nomodified nomodifiable
                    `);
    },
  };
  await denops.cmd(`command! NotionTodo call denops#request('${denops.name}', 'todo', [])`);
};

