connection: "snowlooker"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

explore: users {
  join: order_items {
    type: left_outer
    sql_on: ${users.id} = ${order_items.user_id};;
    relationship: one_to_many
  }
}


# explore: users {
#   join: order_items {
#     type: left_outer
#     sql_on: ${users.id} = ${order_items.user_id};;
#     relationship: one_to_many
#   }
#   sql_always_where: ${order_items.returned_date} IS NULL ;;
#   sql_table_name: ${order_items.total_sales} > 200 ;;
#   always_filter: {
#     filters: [order_items.created_date: "before today"]
#   }
#   conditionally_filter: {
#     filters: [order_items.created_date: "last 2 years"]
#     unless: [users.id]
#   }
# }

# explore: users {
#   join: order_items {
#     type: left_outer
#     sql_on: ${users.id} = ${order_items.user_id};;
#     relationship: one_to_many
#   }
#   always_filter: {
#     filters: [order_items.created_date: "last 30 days"]
#   }
#   conditionally_filter: {
#     filters: [order_items.created_date: "last 90 days"]
#     unless: [users.id, users.state]
#   }
# }
