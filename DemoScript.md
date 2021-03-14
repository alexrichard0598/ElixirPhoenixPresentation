# DEMO

## Create the Project

- `mix phx.new pet_tracker --live --database mysql`
- install dependencies
- Open in VS CODE
- update `config/dev.exs` to `username: dev, password: dev1234`
- `mix ecto.create`
- `mix phx.gen.live Tracker Owner owners firstName lastName age:integer`
- Copy Routes to `lib/pet_tracker_web/router.ex`
- `mix phx.gen.live Tracker Pet pets name type age:integer owner:references:owners`
- Copy Routes to `lib/pet_tracker_web/router.ex`
- `mix ecto.migrate`
- `mix phx.server`

## Modify the Pets

- Add several owners
- Demonstrate issues with adding pets
- Add method to lib\pet_tracker\tracker.ex

```Elixir
def owners_select_opts() do
    Enum.map(list_owners(), fn owner ->
      {"#{owner.firstName} #{owner.lastName}", owner.id}
  end)
end
```

- Change line 9 `lib\pet_tracker_web\live\pet_live\index.ex` to

```Elixir
{
 :ok,
 assign(socket, :pets, list_pets()),
-> temporary_assigns: [select: Tracker.owners_select_opts()]
}
```

- Add to `lib\pet_tracker_web\live\pet_live\index.html.leex`

```Elixir
<%= live_modal @socket, PetTrackerWeb.PetLive.FormComponent,
    id: @pet.id || :new,
    title: @page_title,
    action: @live_action,
    pet: @pet,
->    select: @select,
    return_to: Routes.pet_index_path(@socket, :index) %>
```

- Add to lib\pet_tracker_web\live\pet_live\form_component.html.leex

```Elixir
<%= label f, :owner %>
<%= select(f, :owner, @select) %>
<%= error_tag f, :owner %>
```

- Change `assets\css\phoenix.css` comment out line 27-29
- Demonstrate that it doesn't add owner yet
- Change `lib\pet_tracker\tracker\pet.ex` add owner as modifiable

```Elixir
def changeset(pet, attrs) do
    pet
    |> cast(attrs, [:name, :type, :age, -> :owner])
    |> validate_required([:name, :type, :age, -> :owner])
  end
```

- add min age and max age validation

```Elixir
|> validate_inclusion(:age, 0..120, message: "Age must be between 0 and 120")
```

- Add several pets

- Add table header `<th>Owner</th>`

- Demonstrate `pet.owner` only shows id

- Change line 9 `lib\pet_tracker_web\live\pet_live\index.ex to`

```Elixir
{
 :ok,
 assign(socket, :pets, list_pets()),
 temporary_assigns: [
  select: Tracker.owners_select_opts(),
->  owners: Tracker.list_owners()
 ]
}
```

- Add to `lib\pet_tracker_web\live\pet_live\index.html.leex` at table data

```Elixir
<td>
 <%= for owner <- @owners do %>
  <%= if owner.id == pet.owner do %>
   <%= owner.lastName %>, <%= owner.firstName %>
  <% end %>
 <% end %>
</td>
```

- Add to `lib\pet_tracker_web\live\pet_live\show.ex`

```Elixir
{
 :ok,
 socket,
 temporary_assigns: [
  select: Tracker.owners_select_opts(),
->  owners: Tracker.list_owners()
 ]
}
```

- Add to `lib\pet_tracker_web\live\pet_live\show.html.leex`

```Elixir
<%= live_modal @socket, PetTrackerWeb.PetLive.FormComponent,
    id: @pet.id,
    title: @page_title,
    action: @live_action,
    pet: @pet,
->    select: @select,
    return_to: Routes.pet_show_path(@socket, :show, @pet) %>
```

- Add to `lib\pet_tracker_web\live\pet_live\show.html.leex`

```Elixir
<%= for owner <- @owners do %>
  <%= if owner.id == @pet.owner do %>
 <%= owner.firstName %> <%= owner.lastName %>
  <% end %>
<% end %>
```
