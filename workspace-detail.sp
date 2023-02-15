
dashboard "steampipecloud_workspace_detail" {
  table {
    //width = 6
    title = "Current search path"

    sql = <<-EOQ
      show search_path
    EOQ
  }


  table {
    title = "User Settings"
    //width = 6

    sql = <<-EOQ
      select
        r.rolname,
        d.datname,
        rs.setconfig
      from
        pg_db_role_setting as rs
        left join pg_roles as r on r.oid = rs.setrole
        left join pg_database as d on d.oid = rs.setdatabase

    EOQ
  }


# these dont woerk - gott be root? 

#   container {
#     chart {
#       title = "Table count by Schema"
#       width = 6
#       query = query.table_count_by_schema
#     }

#     table {
#       width = 6
#       query = query.table_count_by_schema
#     }
#   }


}


# // these dont work - gotta be root? 

# query "table_count_by_schema" {
#     sql = <<-EOQ
#       select
#         table_schema, 
#         count(*) as count
#       from 
#         information_schema.tables
#       group by
#         table_schema
#       order by 
#         count desc
#     EOQ
# }

# query "size_by_schema" {
#     sql = <<-EOQ
#       select
#         table_schema, 
#         count(*) as count
#       from 
#         information_schema.tables
#       group by
#         table_schema
#       order by 
#         count desc
#     EOQ
# }
